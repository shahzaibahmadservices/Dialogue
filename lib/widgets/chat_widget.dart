import 'package:flutter/material.dart';
import 'package:dialogue/constants/constants.dart';

class ChatWidget extends StatefulWidget {
  final String msg;
  final int chatIndex;

  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  @override
  ChatWidgetState createState() => ChatWidgetState();
}

class ChatWidgetState extends State<ChatWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        children: [
          Material(
            color: widget.chatIndex == 0
                ? Colors.white
                : Colors.white.withAlpha(10),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 12, bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    widget.chatIndex == 0
                        ? Icons.person_outline
                        : Icons.messenger_outline,
                    color: gClr,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(widget.msg, style: g16),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
