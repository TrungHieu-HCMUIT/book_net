import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/services/guild/guild_provider.dart';
import 'package:book_net/view_models/guild_bloc/guild_event.dart';
import 'package:book_net/view_models/guild_bloc/guild_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuildBloc extends Bloc<GuildEvent, GuildState> {
  GuildBloc() : super(GuildState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<GetAllGuildEvent>(_onGetAllGuildEvent);
  }

  void _onGetAllGuildEvent(
    GetAllGuildEvent event,
    Emitter<GuildState> emit,
  ) async {
    emit(GuildState.inProgress());
    List<GuildDto> guildList = await GuildProvider().getGuildList();

    emit(GuildState.getSuccess(guildList));
  }
}
