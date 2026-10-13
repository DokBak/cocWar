/// 화면 본문의 최대 폭. 홈·설정·클랜·플레이어 화면과, 나란히 보기의 왼쪽·오른쪽 창이
/// 모두 이 폭을 써서 어느 화면에서든 같은 폭으로 보인다.
const contentMaxWidth = 640.0;

/// 나란히 보기의 두 창 사이 구분선 폭.
const splitDividerWidth = 1.0;

/// 나란히 보기(창 두 개)에 필요한 최소 화면 너비. 두 창 + 구분선 + 양옆 여백.
/// 이보다 좁으면 확장 버튼이 보이지 않고, 멤버를 누르면 프로필 페이지로 이동한다.
const splitViewMinWidth = contentMaxWidth * 2 + splitDividerWidth + 32;
