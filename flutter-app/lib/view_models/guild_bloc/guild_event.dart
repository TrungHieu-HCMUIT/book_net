import 'package:equatable/equatable.dart';

abstract class GuildEvent extends Equatable {
  const GuildEvent();

  @override
  List<Object> get props => [];
}

class GetAllGuildEvent extends GuildEvent {
  const GetAllGuildEvent();

  @override
  List<Object> get props => [];
}
