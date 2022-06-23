import 'package:book_net/view_models/create_news_bloc/create_news_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_net/dto/news/base_news_dto.dart';
import 'create_news_state.dart';

class CreateNewsBloc extends Bloc<CreateNewsEvent, CreateNewsState> {
  CreateNewsBloc() : super(const CreateNewsState.initial()) {
    _mapEventToState();
  }

  void _mapEventToState() {
    on<PushNewsEvent>(_onPushNewsEvent);
  }

  void _onPushNewsEvent(
    PushNewsEvent event,
    Emitter<CreateNewsState> emit,
  ) async {
    emit(const CreateNewsState.inProgress());
    // List<String> imagesUrl =
    // await FirebaseService().uploadNewsImages(event.files);
    // await AuthenticationProvider().logIn('trunnghieu', '@doandoan');
    // await FeedProvider()
    //     .createPostNews(CurrUserData().userId, event.caption, imagesUrl);
    await Future.delayed(const Duration(seconds: 2));

    emit(const CreateNewsState.pushSuccess());
  }
}
