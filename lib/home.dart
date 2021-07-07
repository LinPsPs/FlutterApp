import 'package:flutter/material.dart';
import 'package:test_app/tabViews/discussion.dart';
import 'package:test_app/widgets/rainbow_text.dart';

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
    print(MediaQuery.of(context).size.toString());
    return DefaultTabController(
      length: _sections.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (MediaQuery.of(context).size.width >= 670) Container(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/icon.png'),
                ),
                Container(
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(left: 30, right: 30),
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
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.red,
                      onPrimary: Colors.orangeAccent,
                    ),
                    onPressed: () => print('TODO'),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.login,
                        color: Colors.orangeAccent,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Discussion(),
            Discussion(),
            Discussion(),
            Discussion(),
            Discussion(),
          ],
        ),
      ),
    );
  }
}
