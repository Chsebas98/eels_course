import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/app/di/di.dart';
import 'package:san_chat/chat/bloc/chat_bloc.dart';
import 'package:san_chat/chat/widgets/widgets.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';
import 'package:san_chat/data/repositories/auth_repositories/auth_repository.dart';
import 'package:san_chat/data/repositories/message_repository/message_repository.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener los argumentos que se envian en la Ruta
    final contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return BlocProvider(
      create: (context) => ChatBloc(
        authRepository: getIt<AuthRepository>(),
        messagesRepository: getIt<MessagesRepository>(),
      )..add(GetMessagesEvent(contactId: contact.id!)),
      child: ChatPageView(contact: contact),
    );
  }
}

class ChatPageView extends StatelessWidget {
  const ChatPageView({super.key, required this.contact});
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: ChatAppBarTitle(contact: contact)),
      body: Stack(
        children: [
          // List de mensajes
          Messages(contact: contact),
          // Widget
          ChatTextFormField(contactId: contact.id!),
        ],
      ),
    );
  }
}
