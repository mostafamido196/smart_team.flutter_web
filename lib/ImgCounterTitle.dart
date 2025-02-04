import 'package:flutter/material.dart';

class ImgCounterTitle extends StatefulWidget {
  final String imgPath;
  final int target;
  final String title;

  const ImgCounterTitle({
    super.key,
    required this.imgPath,
    required this.target,
    required this.title,
  });

  @override
  State<ImgCounterTitle> createState() => _ImgCounterTitleState();
}

class _ImgCounterTitleState extends State<ImgCounterTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(widget.imgPath, width: 66, height: 66),
        const SizedBox(height: 5),
        Text(widget.target.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
        // const SizedBox(height: 10),
        Text(widget.title,
            style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 12,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
