part of 'inbox_bloc.dart';

sealed class InboxEvent extends Equatable {
  const InboxEvent();

  @override
  List<Object> get props => [];
}


class FetchUserChat extends InboxEvent {}