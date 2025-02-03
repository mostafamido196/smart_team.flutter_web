import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverableRow extends StatefulWidget {
  final String imagePath;
  final String text;

  HoverableRow({required this.imagePath, required this.text});

  @override
  _HoverableRowState createState() => _HoverableRowState();
}

class _HoverableRowState extends State<HoverableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Handle click action here
          print('Row clicked!');
        },
        child: Container(
          color: _isHovered ? Colors.grey[300] : Colors.transparent, // Change background on hover
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(widget.imagePath, width: 30, height: 30), // Image
              SizedBox(width: 5),
              Text(widget.text, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}