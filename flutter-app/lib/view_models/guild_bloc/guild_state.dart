import 'package:book_net/view_models/status.dart';
import 'package:equatable/equatable.dart';

import '../../dto/guild/guild_dto.dart';

class GuildState extends Equatable {
  GuildState._({this.status = Status.initial, this.result = const []});

  final Status status;

  List<GuildDto> result;

  GuildState.initial() : this._();

  GuildState.inProgress() : this._(status: Status.inProgress);

  GuildState.getFail() : this._(status: Status.fail);

  GuildState.getSuccess(List<GuildDto> result)
      : this._(status: Status.success, result: result);

  @override
  List<Object> get props => [status];
}
