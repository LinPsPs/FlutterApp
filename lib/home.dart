import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/tabViews/discussion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabController _tabController;
  final List<String> _sections = ['首页', '讨论回答', '租房信息', '东西买卖', '学生指南'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _sections.length,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/images/usc_icon.png'),
          actions: [
            ElevatedButton(
              onPressed: null,
              child: Icon(
                Icons.login,
                color: Colors.orangeAccent,
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 0, right: 0),
            child: TabBar(
              indicatorColor: Colors.orangeAccent,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: [
                for (String _section in _sections)
                  Tab(
                    text: _section,
                  )
              ],
            ),
          ),
        ), //appbar
        body: TabBarView(
          children: [
            Discussion(),
            Center(child: Text('CATS')),
            Center(child: Text('DOGS')),
            Center(child: Text('CATS')),
            Center(child: Text('DOGS')),
          ],
        ),
      ),
    );
  }
}
