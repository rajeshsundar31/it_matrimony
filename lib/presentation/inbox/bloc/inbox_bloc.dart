import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:it_matrimony/core/services/api_services.dart';
import 'package:it_matrimony/presentation/inbox/model/inbox_model.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final ApiServices _apiServices;

  InboxBloc(this._apiServices) : super(InboxInitial()) {
    on<InboxEvent>((event, emit) async {
      try {

        final response = await _apiServices.getResponse("/users");


        if (response == null){
          emit(InboxError(response));
        }

        final List inboxList = jsonDecode(response);

        final inbox = inboxList.map((messagelist) => InboxModel.fromJson(messagelist)).toList();
        emit(FetchInboxChat(inbox));

      } catch (e) {
       emit(InboxError("$e"));
      }
    });
  }
}
