import 'package:flutter/material.dart';
import 'package:gossip_v01/service/ChatService.dart';
import 'package:gossip_v01/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageId;
  final String userId;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.messageId,
    required this.userId,
  });

  //show options
  void _showOptions(BuildContext context, String messageId, String userId) {
    showBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
            child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.flag),
              title: const Text('Report'),
              onTap: () {
                Navigator.pop(context);
                _reportContent(context, messageId, userId);
              },
            ),
            ListTile(
              leading: Icon(Icons.block),
              title: const Text('Block User'),
              onTap: () {
                 Navigator.pop(context);
                _blockUser(context, userId);
              },
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: const Text('Cancal'),
              onTap: () {
                 Navigator.pop(context);
              },
            )
          ],
        ));
      },
    );
  }

  //report mess
  void _reportContent(BuildContext context, String messageId, String userId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Report Message"),
          content: Text("Are you sure you want to report this message"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                ChatService().reportMessage(messageId, userId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Message Reported')));
              },
              child: Text("Report"),
            )
          ],
        )
    );
  }
  //block user
  void _blockUser(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Block User"),
          content: Text("Are you sure you want to block this user"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                ChatService().blockUser(userId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('User Blocked')));
              },
              child: Text("Blocked"),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          _showOptions(context, messageId, userId);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Colors.green.shade700 : Colors.grey.shade500)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(13),
        ),
        padding: EdgeInsets.all(17),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 23),
        child: Text(
          message,
          style: TextStyle(
              color: isCurrentUser
                  ? Colors.white
                  : (isDarkMode ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}
