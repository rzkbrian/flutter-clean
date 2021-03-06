import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class InitialState extends ProfileState {}

class LoadingState extends ProfileState {}

class UserReadyState extends ProfileState {
  final User user;

  UserReadyState({@required this.user});

  @override
  List<Object> get props => [user];
}

class ErrorState extends ProfileState {
  final String error;

  ErrorState({@required this.error});

  @override
  List<Object> get props => [error];
}
