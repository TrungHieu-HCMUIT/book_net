import 'package:book_net/dto/news/base_news_dto.dart';
import 'package:book_net/view_models/feed_bloc/feed_event.dart';
import 'package:book_net/view_models/feed_bloc/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<GetFeedEvent>(_onGetFeedEvent);
    on<AddPostNewsEvent>(_onAddPostNewsEvent);
    on<AddGuildNewsEvent>(_onAddGuildNewsEvent);
    on<AddReviewNewsEvent>(_onAddReviewNewsEvent);
    on<UpdateNewsEvent>(_onUpdateNewsEvent);
  }

  void _onGetFeedEvent(
    GetFeedEvent event,
    Emitter<FeedState> emit,
  ) async {
    // emit(FeedState.inProgress());
    // List<NewsResponseDto> newsList =
    //     await FeedProvider().getFeed(CurrUserData().userId);

    emit(FeedState.addSuccess());
  }

  void _onAddPostNewsEvent(
    AddPostNewsEvent event,
    Emitter<FeedState> emit,
  ) async {
    newsListTest.add(postNewsTestModel);
    emit(FeedState.addSuccess());
  }

  void _onAddGuildNewsEvent(
    AddGuildNewsEvent event,
    Emitter<FeedState> emit,
  ) async {
    newsListTest.add(guildNewsTestModel);
    emit(FeedState.addSuccess());
  }

  void _onAddReviewNewsEvent(
    AddReviewNewsEvent event,
    Emitter<FeedState> emit,
  ) async {
    newsListTest.add(reviewNewsTestModel);
    emit(FeedState.addSuccess());
  }

  void _onUpdateNewsEvent(
    UpdateNewsEvent event,
    Emitter<FeedState> emit,
  ) async {
    emit(FeedState.addSuccess());
  }
}
