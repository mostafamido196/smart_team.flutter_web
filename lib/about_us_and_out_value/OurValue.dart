import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OurValueWedget extends StatelessWidget {
  OurValueWedget({super.key});
  final List quotes = [
    {
      "quote":
      "It’s your place in the world; it’s your life. Go on and do all you can with it, and make it the life you want to live.",
      "author": "Mae Jemison"
    },
    {
      "quote":
      "You may be disappointed if you fail, but you are doomed if you don’t try.",
      "author": "Beverly Sills"
    },
    {
      "quote":
      "Remember no one can make you feel inferior without your consent.",
      "author": "Eleanor Roosevelt"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 480),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OUR VALUE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),

          /// Wrap ListView with Expanded or SizedBox to provide a fixed height
          SizedBox(
            height: 300, // Adjust height as needed
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: quotes.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildExpandableTile(quotes[index]);
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildExpandableTile(item) {
    return ExpansionTile(
      title: Text(
        item['author'],
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            item['quote'],
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
