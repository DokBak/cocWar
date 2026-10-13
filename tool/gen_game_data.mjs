// 앱이 쓰는 게임 데이터 두 가지를 만든다. (사용: tool/gen_game_data.sh)
//   1. level_caps.json  : 타운홀별 영웅·장비·부대·주문 최고 레벨 표
//   2. item_groups.json : 장비가 어느 영웅의 것인지, 부대·주문이 어느 자원(엘릭서/다크엘릭서)인지,
//                         시즈머신·펫 구분
// 공식 API가 주지 않는 정보라서 커뮤니티 데이터(clash-of-clans-data)로 만든다.
// 결과는 이미지가 아닌 수치·분류뿐이라 저장소에 커밋한다.
//
// [1] 최고 레벨 표
// 공식 API의 maxLevel은 게임 전체 최대 레벨이라 "현재 타운홀에서의 최고 레벨"을 알려주지 않는다.
// 그래서 커뮤니티 데이터(clash-of-clans-data)의 레벨별 요구 조건으로 계산한다.
//   - 부대·주문·펫·공성 병기: 레벨마다 townHallRequired
//   - 영웅: 레벨마다 heroHallLevelRequired (영웅 회관 레벨 → 타운홀은 hero-hall 데이터)
//   - 장비: 레벨마다 blacksmithLevelRequired (대장간 레벨 → 타운홀은 blacksmith 데이터)
// 장인기지는 별도 표(builderHeroes, builderTroops)로, 장인 회관 레벨별 최고 레벨을 담는다.
// 본마을과 이름이 같은 유닛(예: Baby Dragon)이 있어서 표를 따로 둔다.
//   - 영웅: 레벨마다 builderHallLevelRequired
//   - 유닛: 레벨마다 starLabRequired (스타 연구소 레벨 → 장인 회관은 star-laboratory 데이터)
import fs from 'node:fs';
import path from 'node:path';

const [pkgDir, outDir, source] = process.argv.slice(2);
const home = path.join(pkgDir, 'data', 'home');
const read = (...p) => JSON.parse(fs.readFileSync(path.join(home, ...p), 'utf8'));

const maxTownHall = Math.max(...read('town-hall', 'town-hall.json').levels.map((l) => l.level));

// 건물 레벨 → 필요한 타운홀. 타운홀 th에서 지을 수 있는 가장 높은 건물 레벨을 구한다.
const buildingLevelAt = (file) => {
  const levels = read('army-buildings', file).levels;
  return (th) =>
    Math.max(0, ...levels.filter((l) => l.townHallRequired <= th).map((l) => l.level));
};
const heroHallAt = buildingLevelAt('hero-hall.json');
const blacksmithAt = buildingLevelAt('blacksmith.json');

const table = (fn) => Array.from({ length: maxTownHall }, (_, i) => fn(i + 1));
const maxLevel = (levels, ok) => Math.max(0, ...levels.filter(ok).map((l) => l.level));

const collect = (dirs, capsFor) => {
  const result = {};
  for (const dir of dirs) {
    for (const file of fs.readdirSync(path.join(home, dir)).filter((f) => f.endsWith('.json'))) {
      const levels = read(dir, file).levels;
      if (!Array.isArray(levels) || levels.length === 0) continue;
      result[file.replace(/\.json$/, '')] = table((th) => capsFor(levels, th));
    }
  }
  return result;
};

// ── 장인기지 ───────────────────────────────────────────────────────────────────
const builder = (...p) =>
  JSON.parse(fs.readFileSync(path.join(pkgDir, 'data', 'builder', ...p), 'utf8'));
const maxBuilderHall = Math.max(
  ...builder('builder-hall', 'builder-hall.json').levels.map((l) => l.level),
);
const starLabLevels = builder('army-buildings', 'star-laboratory.json').levels;
// 장인 회관 bh에서 지을 수 있는 가장 높은 스타 연구소 레벨
const starLabAt = (bh) => maxLevel(starLabLevels, (l) => (l.builderHallRequired ?? 0) <= bh);

const collectBuilder = (dir, capsFor) => {
  const result = {};
  for (const file of fs.readdirSync(path.join(pkgDir, 'data', 'builder', dir))) {
    if (!file.endsWith('.json')) continue;
    const levels = builder(dir, file).levels;
    if (!Array.isArray(levels) || levels.length === 0) continue;
    result[file.replace(/\.json$/, '')] = Array.from({ length: maxBuilderHall }, (_, i) =>
      capsFor(levels, i + 1),
    );
  }
  return result;
};

const out = {
  source,
  maxTownHall,
  // 키는 앱의 gameSlug()와 같은 규칙의 이름. 값은 타운홀 1..maxTownHall별 최고 레벨(미해금은 0).
  heroes: collect(['heroes'], (lv, th) =>
    maxLevel(lv, (l) => (l.heroHallLevelRequired ?? 0) <= heroHallAt(th)),
  ),
  equipment: collect(['hero-equipment'], (lv, th) =>
    maxLevel(lv, (l) => (l.blacksmithLevelRequired ?? 0) <= blacksmithAt(th)),
  ),
  // API는 일반 부대·펫·공성 병기를 모두 troops에 넣어 준다.
  troops: collect(['troops', 'pets', 'siege-machines'], (lv, th) =>
    maxLevel(lv, (l) => (l.townHallRequired ?? 0) <= th),
  ),
  spells: collect(['spells'], (lv, th) =>
    maxLevel(lv, (l) => (l.townHallRequired ?? 0) <= th),
  ),
  // 장인기지: 값은 장인 회관 1..maxBuilderHall별 최고 레벨.
  maxBuilderHall,
  builderHeroes: collectBuilder('heroes', (lv, bh) =>
    maxLevel(lv, (l) => (l.builderHallLevelRequired ?? 0) <= bh),
  ),
  builderTroops: collectBuilder('troops', (lv, bh) =>
    maxLevel(lv, (l) => (l.starLabRequired ?? 0) <= starLabAt(bh)),
  ),
};

// ── [2] 항목 분류 ──────────────────────────────────────────────────────────────
// 키는 모두 앱의 gameSlug()와 같은 규칙의 이름이다.
const groupBy = (dir, pick) =>
  Object.fromEntries(
    fs
      .readdirSync(path.join(home, dir))
      .filter((f) => f.endsWith('.json'))
      .map((f) => [f.replace(/\.json$/, ''), pick(read(dir, f))]),
  );

// 패키지에 아직 없는 신규 항목의 수동 예외. 새 버전이 나오면 먼저 패키지 값을 쓰고, 없을 때만 적용한다.
const EXTRA_EQUIPMENT_HERO = {
  // 이벤트 한정 신규 장비. 미니언 프린스의 7번째 장비(에픽).
  // 출처: https://supercell.com/en/games/clashofclans/blog/news/the-portal-panic-medal-event-rifts-its-way-into-clash
  'portal-pendant': 'minion-prince',
};

const groups = {
  source,
  // 장비 → 영웅
  equipmentHero: { ...EXTRA_EQUIPMENT_HERO, ...groupBy('hero-equipment', (d) => d.hero) },
  // 부대·펫·공성 병기 → elixir | dark | pet | siege (API는 모두 troops에 넣어 준다)
  troopGroup: {
    ...groupBy('troops', (d) => (d.troopType === 'dark' ? 'dark' : 'elixir')),
    ...groupBy('pets', () => 'pet'),
    ...groupBy('siege-machines', () => 'siege'),
  },
  // 주문 → elixir | dark
  spellGroup: groupBy('spells', (d) => (d.spellType === 'dark' ? 'dark' : 'elixir')),
};

fs.mkdirSync(outDir, { recursive: true });
fs.writeFileSync(path.join(outDir, 'level_caps.json'), JSON.stringify(out) + '\n');
fs.writeFileSync(path.join(outDir, 'item_groups.json'), JSON.stringify(groups) + '\n');
const count = (o) => Object.keys(o).length;
console.log(
  `level_caps.json: 타운홀 1~${maxTownHall} | 영웅 ${count(out.heroes)}, 장비 ${count(out.equipment)}, ` +
    `부대·펫·공성 ${count(out.troops)}, 주문 ${count(out.spells)}`,
);
console.log(
  `장인기지: 장인 회관 1~${maxBuilderHall} | 영웅 ${count(out.builderHeroes)}, 유닛 ${count(out.builderTroops)}`,
);
console.log(
  `item_groups.json: 장비→영웅 ${count(groups.equipmentHero)}, 부대 그룹 ${count(groups.troopGroup)}, ` +
    `주문 그룹 ${count(groups.spellGroup)} -> ${outDir}`,
);
