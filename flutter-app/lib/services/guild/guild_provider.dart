import 'dart:collection';
import 'dart:convert';

import 'package:book_net/dto/guild/guild_dto.dart';

import 'guild_repository.dart';

class GuildProvider {
  static final _singleton = GuildProvider._internal();

  factory GuildProvider() {
    return _singleton;
  }

  GuildProvider._internal();

  Future<List<GuildDto>> getGuildList() async {
    var response = await GuildRepository().getGuildList();
    List list = response.data['data'];

    List<GuildDto> result = list.map((i) => GuildDto.fromJson(i)).toList();

    return result;
  }
}
