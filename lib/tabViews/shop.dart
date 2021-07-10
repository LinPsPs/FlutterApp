import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter/material.dart';
import 'package:forum/widgets/editor.dart';
import 'package:forum/widgets/rainbow_text.dart';

import '../pages/post_page.dart';


class Shop extends StatefulWidget {
  QuillController _controller = QuillController.basic();

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cons, ctx) {
      return Container(
        child: Row(
          children: [
            Container(
              width: ctx.maxWidth * 0.2,
              child: RainbowText('Test'),
            ),
            Container(
              width: ctx.maxWidth * 0.6,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 8,
                )
              ),
              child: PostPage(),
            ),
            Container(
              width: ctx.maxWidth * 0.2,
              child: RainbowText('Test'),
            ),
          ],
        ),
      );
    });
  }
}