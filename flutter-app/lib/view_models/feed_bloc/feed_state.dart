import 'package:book_net/dto/news/news_response_dto.dart';
import 'package:book_net/view_models/status.dart';
import 'package:equatable/equatable.dart';

class FeedState extends Equatable {
  FeedState._({this.status = Status.initial, this.result = const []});

  final Status status;

  List<NewsResponseDto> result;

  FeedState.initial() : this._();

  FeedState.inProgress() : this._(status: Status.inProgress);

  FeedState.addSuccess() : this._(status: Status.inProgress);

  FeedState.getFail() : this._(status: Status.fail);

  FeedState.getSuccess(List<NewsResponseDto> result)
      : this._(status: Status.success, result: result);

  @override
  List<Object> get props => [status];
}
