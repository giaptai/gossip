import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(13),
        ),
        margin: EdgeInsets.symmetric(vertical: 7, horizontal: 27),
        padding: EdgeInsets.all(19),
        child: Row(
          children: [
            Icon(
              Icons.person,
            ),
            const SizedBox(
              width: 23,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
