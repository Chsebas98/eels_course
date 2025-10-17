import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/chat/bloc/chat_bloc.dart';
import 'package:san_chat/chat/widgets/message_tile.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.contact});

  final Contact contact;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        });
      },
      builder: (context, state) {
        final messages = state.messages;

        if (messages.isEmpty) {
          return Center(child: Text('No tienes mensajes todavía'));
        }

        return ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 100),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            return MessageTile(
              mySelf: message.sentBy != widget.contact.id,
              userName: widget.contact.name,
              msg: message.message,
              date: message.messageDate,
              photoUrl: widget.contact.photo,
            );
          },
        );
      },
    );
  }
}
