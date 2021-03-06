import 'package:DemoFlutter/domain/entities/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class InitialState extends FeedState {}

class LoadingState extends FeedState {}

class FeedListReadyState extends FeedState {
  final List<Post> feedList;

  FeedListReadyState({@required this.feedList});

  @override
  List<Object> get props => [feedList];
}

class ErrorState extends FeedState{
 final  String error;

  ErrorState({@required this.error});
  @override
  List<Object> get props => [error];
}
