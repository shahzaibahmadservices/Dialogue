import 'package:flutter/material.dart';
import 'package:dialogue/constants/constants.dart';

class QueryBar extends StatefulWidget {
  final Function(bool) setTyping;
  final Function(String) sendMessage;

  const QueryBar(
      {super.key, required this.setTyping, required this.sendMessage});

  @override
  State<QueryBar> createState() => _QueryBarState();
}

class _QueryBarState extends State<QueryBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    widget.sendMessage(value);
                  }
                  _controller.clear();
                },
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  hintStyle: g16,
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: gClrwithAlpha, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: gClr, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: gClr, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                ),
                style: g16,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (_controller.text.trim().isNotEmpty) {
                  widget.sendMessage(_controller.text);
                  _controller.clear();
                }
                FocusScope.of(context).unfocus();
              },
              icon: const Icon(Icons.send, color: gClr),
            ),
          ],
        ),
      ),
    );
  }
}
