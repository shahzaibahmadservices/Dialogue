import 'package:flutter/material.dart';
import 'package:dialogue/constants/constants.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.2)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: Container(
            padding:
            const EdgeInsets.only(left: 18, right: 18, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: wClr,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [shadowBox],
            ),
            child: Text('Dialogue AI', style: g18),
          ),
        );
      },
    );
  }
}
