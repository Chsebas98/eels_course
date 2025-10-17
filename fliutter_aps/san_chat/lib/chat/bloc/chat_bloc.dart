import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';
import 'package:san_chat/data/repositories/message_repository/message_repository.dart';
import 'package:san_chat/domain/models/message.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({required this.authRepository, required this.messagesRepository})
    : super(ChatState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
    on<GetMessagesEvent>(_onGetMessagesEvent);
  }

  final AuthRepository authRepository;
  final MessagesRepository messagesRepository;

  FutureOr<void> _onSendMessageEvent(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  ) async {
    if (event.message.isEmpty) return;
    final user = await authRepository.user;
    final date = DateTime.now().toIso8601String();
    if (user == null) return;

    messagesRepository.sendMessage(
      _getChatId(user.uid, event.contactId),
      event.message,
      date,
      user.uid,
    );
  }

  String _getChatId(String currentUserId, String contactId) {
    final chatIds = [currentUserId, contactId]..sort();
    return '${chatIds[0]}_${chatIds[1]}';
  }

  FutureOr<void> _onGetMessagesEvent(
    GetMessagesEvent event,
    Emitter<ChatState> emit,
  ) async {
    final user = await authRepository.user;
    if (user == null) return;
    return emit.forEach(
      messagesRepository.getMessages(_getChatId(user.uid, event.contactId)),
      onData: (messages) {
        return state.copyWith(messages: messages);
      },
    );
  }
}
