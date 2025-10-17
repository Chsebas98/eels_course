import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/chat/bloc/chat_bloc.dart';

class ChatTextFormField extends StatefulWidget {
  const ChatTextFormField({super.key, required this.contactId});

  final String contactId;

  @override
  State<ChatTextFormField> createState() => _ChatTextFormFieldState();
}

class _ChatTextFormFieldState extends State<ChatTextFormField> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: colorScheme.surface,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12).copyWith(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _messageController,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: AppColors.greyCircleBorder,
                    hintText: 'Write your message',
                    hintStyle: TextStyle(fontSize: 12, color: AppColors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyCircleBorder),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyCircleBorder),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.small(
                onPressed: () {
                  final message = _messageController.text.trim();
                  if (message.isEmpty) return;
                  context.read<ChatBloc>().add(
                    SendMessageEvent(
                      message: message,
                      contactId: widget.contactId,
                    ),
                  );
                  _messageController.clear();
                },
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
