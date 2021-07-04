import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionBar extends StatefulWidget {
  _SectionBarState createState() => _SectionBarState();
}

class _SectionBarState extends State<SectionBar> {
  int _lastSelected = 0;
  final List<String> _sections = ['首页', '讨论回答', '租房信息', '东西买卖', '学生指南'];
  final List<bool> _isSelected = [true, false, false, false, false];
  
  void updateButtonView(index) {
    setState(() {
      _isSelected[_lastSelected] = false;
      _isSelected[index] = true;
      _lastSelected = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          for(int i = 0; i < _isSelected.length; i++)
            TextButton(
              child: _isSelected[i] ? Container(
                child: Text(_sections[i], style: Theme
                    .of(context)
                    .textTheme
                    .headline1),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.orangeAccent),
                  )
                ),
              ) : Container(
                child: Text(_sections[i], style: Theme
                    .of(context)
                    .textTheme
                    .headline1),
              ),
              onPressed: () => updateButtonView(i),
            )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    // return ToggleButtons(
    //   children: [
    //     for(int i = 0; i < _isSelected.length; i++)
    //       _isSelected[i] ? Container(
    //         child: Text(_sections[i], style: Theme
    //             .of(context)
    //             .textTheme
    //             .headline1),
    //         padding: const EdgeInsets.all(8),
    //         decoration: BoxDecoration(
    //           border: Border(
    //             bottom: BorderSide(width: 3, color: Colors.orangeAccent),
    //           )
    //         ),
    //       ) : Container(
    //         child: Text(_sections[i], style: Theme
    //             .of(context)
    //             .textTheme
    //             .headline1),
    //         padding: const EdgeInsets.all(8),
    //       )
    //   ],
    //   isSelected: _isSelected,
    //   onPressed: (int index) => updateButtonView(index),
    //   renderBorder: false,
    // );
  }
}