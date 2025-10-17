import 'package:flutter/material.dart';
import 'package:san_chat/app/core/ui/ui.dart';
import 'package:san_chat/app/core/widgets/chat_avatar.dart';
import 'package:san_chat/data/domain/models/contact_model.dart';

class ChatAppBarTitle extends StatelessWidget {
  const ChatAppBarTitle({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ChatAvatar(name: contact.name, photoUrl: contact.photo),
            SizedBox(
              width: 12,
              height: 12,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: contact.status
                      ? AppColors.statusColorConnected
                      : AppColors.statusColorDisconect,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text(contact.name, style: textTheme.labelLarge),
            subtitle: Text(
              contact.status ? 'In Line' : 'Offline',
              style: textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
