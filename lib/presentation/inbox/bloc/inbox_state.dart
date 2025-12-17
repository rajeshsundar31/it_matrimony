part of 'inbox_bloc.dart';

sealed class InboxState extends Equatable {
  const InboxState();
  
  @override
  List<Object> get props => [];
}

class InboxInitial extends InboxState {}

class InboxLoading extends InboxState {}

class FetchInboxChat extends InboxState {

  final List<InboxModel> inbox;

  const FetchInboxChat(this.inbox);

  @override
  List<Object> get props => [inbox];
}

class InboxError extends InboxState {
  final String message;

  const InboxError(this.message);

  @override
  List<Object> get props => [message];
}


