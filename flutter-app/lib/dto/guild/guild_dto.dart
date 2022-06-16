import 'package:freezed_annotation/freezed_annotation.dart';

part 'guild_dto.freezed.dart';
part 'guild_dto.g.dart';

@freezed
class GuildDto with _$GuildDto {
  const factory GuildDto({
    required String id,
    required String imageUrl,
    required String name,
    required String description,
    required List<String> memberList,
  }) = _GuildDto;

  factory GuildDto.fromJson(Map<String, dynamic> json) =>
      _$GuildDtoFromJson(json);
}
