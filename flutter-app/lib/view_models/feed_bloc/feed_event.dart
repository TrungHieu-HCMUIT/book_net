import 'package:equatable/equatable.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class GetFeedEvent extends FeedEvent {
  const GetFeedEvent();

  @override
  List<Object> get props => [];
}
