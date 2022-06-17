import 'package:book_net/dto/news/news_response_dto.dart';
import 'package:book_net/view_models/status.dart';
import 'package:equatable/equatable.dart';

class VerifyEmailState extends Equatable {
  VerifyEmailState._({this.status = Status.initial, this.result = const []});

  final Status status;

  List<NewsResponseDto> result;

  VerifyEmailState.initial() : this._();

  VerifyEmailState.inProgress() : this._(status: Status.inProgress);

  VerifyEmailState.pushFail() : this._(status: Status.fail);

  VerifyEmailState.pushSuccess() : this._(status: Status.success);

  @override
  List<Object> get props => [status];
}
