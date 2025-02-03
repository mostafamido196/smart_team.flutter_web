import 'package:flutter/material.dart';

import 'HoverableRow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconWidth;
    if (screenWidth < 600) {
      iconWidth = 500;
    } else {
      iconWidth = screenWidth * 0.40;
    }
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 6),
          child: Wrap(
            spacing: 10,
            // Horizontal space between items
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                icon: Image.asset('assets/img/icon_bg.png', width: iconWidth),
                onPressed: () {}, // Handle menu action
              ),
              Container(
                // color: Colors.blue,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Centers items horizontally
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    _buildColumn("Call Us", "22619723"),
                    SizedBox(
                      width: 8,
                    ),
                    _buildVerticalDivider(),
                    SizedBox(
                      width: 8,
                    ),
                    _buildColumn("Email Us", "info@al-injaz.net"),
                    SizedBox(
                      width: 8,
                    ),
                    _buildVerticalDivider(),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Our Projects",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _buildVerticalDivider(),
                    SizedBox(
                      width: 16,
                    ),
                    _buildRowWithImage(
                        "assets/img/saudi-arabia.jpg", "العربية"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(180);

  Widget _buildColumn(String text, String boldText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: TextStyle(fontSize: 12)),
        SizedBox(height: 5),
        Text(
          boldText,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
  Widget _buildRowWithImage(String imagePath, String text) {
    return HoverableRow(
      imagePath: imagePath,
      text: text,
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 40, // Adjust height based on content
      width: 1, // Divider width
      color: Colors.grey.shade400, // Divider color
      margin: EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
