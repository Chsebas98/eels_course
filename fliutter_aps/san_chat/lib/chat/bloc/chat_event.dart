part of 'chat_bloc.dart';

sealed class ChatEvent {}

// Evento para enviar mensajes
class SendMessageEvent extends ChatEvent {
  final String message;
  final String contactId;

  SendMessageEvent({required this.message, required this.contactId});
}

// Evento para obtener los mensajes de un chat especifico
class GetMessagesEvent extends ChatEvent {
  final String contactId;

  GetMessagesEvent({required this.contactId});
}
