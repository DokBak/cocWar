import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging.freezed.dart';
part 'paging.g.dart';

@freezed
abstract class Cursors with _$Cursors {
  const factory Cursors({String? after, String? before}) = _Cursors;

  factory Cursors.fromJson(Map<String, dynamic> json) =>
      _$CursorsFromJson(json);
}

@freezed
abstract class Paging with _$Paging {
  const factory Paging({Cursors? cursors}) = _Paging;

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);
}
