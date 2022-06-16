import 'package:book_net/dto/guild/guild_dto.dart';
import 'package:book_net/dto/news/news_response_dto.dart';
import 'package:book_net/services/feed/feed_provider.dart';
import 'package:book_net/services/guild/guild_provider.dart';
import 'package:book_net/view_models/feed_bloc/feed_event.dart';
import 'package:book_net/view_models/feed_bloc/feed_state.dart';
import 'package:book_net/view_models/guild_bloc/guild_event.dart';
import 'package:book_net/view_models/guild_bloc/guild_state.dart';
import 'package:book_net/view_models/user/curr_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<GetFeedEvent>(_onGetFeedEvent);
  }

  void _onGetFeedEvent(
    GetFeedEvent event,
    Emitter<FeedState> emit,
  ) async {
    // emit(FeedState.inProgress());
    // List<NewsResponseDto> newsList =
    //     await FeedProvider().getFeed(CurrUserData().userId);

    // emit(FeedState.getSuccess(newsList));
  }
}
