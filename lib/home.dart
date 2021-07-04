import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/widgets/section_bar.dart';

const int tabCount = 2;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints cons) {
          return Row(
            children: [
              Container(
                width: cons.maxWidth * 0.2,
                alignment: Alignment.centerLeft,
                child: Text('USC Forum'),
              ),
              Container(
                width: cons.maxWidth * 0.6,
                alignment: Alignment.center,
                child: SectionBar(),
              ),
              Container(
                width: cons.maxWidth * 0.2,
                alignment: Alignment.centerRight,
                child: Text('Login'),
              )
            ],
          );
        }
    );
  }
}

