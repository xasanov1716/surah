import 'package:flutter/material.dart';

class MediaItem extends StatelessWidget {
  final Widget child;
  const MediaItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(child: child),
    );
  }
}