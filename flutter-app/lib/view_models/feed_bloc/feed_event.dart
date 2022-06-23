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

class AddPostNewsEvent extends FeedEvent {
  const AddPostNewsEvent();

  @override
  List<Object> get props => [];
}

class AddGuildNewsEvent extends FeedEvent {
  const AddGuildNewsEvent();

  @override
  List<Object> get props => [];
}

class AddReviewNewsEvent extends FeedEvent {
  const AddReviewNewsEvent();

  @override
  List<Object> get props => [];
}

class UpdateNewsEvent extends FeedEvent {
  const UpdateNewsEvent();

  @override
  List<Object> get props => [];
}
