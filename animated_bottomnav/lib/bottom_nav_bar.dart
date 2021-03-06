import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  BottomNavBar(
      {this.barItems, this.animationDuration, this.onBarTap, this.barStyle});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16.0,
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
             selectedBarIndex = i;
             widget.onBarTap(selectedBarIndex) ;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color: isSelected
                  ? item.color.withOpacity(0.15)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: isSelected ? item.color : Colors.black,
                  size: widget.barStyle.iconSize,
                ),
                SizedBox(
                  width: 10.0,
                ),
                AnimatedSize(
                    duration: widget.animationDuration,
                    curve: Curves.easeInOut,
                    vsync: this,
                    child: Text(
                      isSelected ? item.text : "",
                      style: TextStyle(
                          color: item.color,
                          fontWeight: widget.barStyle.fontWeight,
                          fontSize: widget.barStyle.fontSize
                          ),
                    )
                    )
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;
  

  BarStyle(
      {this.fontSize = 18.0,
      this.iconSize = 32.0,
      this.fontWeight = FontWeight.w400});
}

class BarItem {
  String text;
  IconData iconData;
  Color color;
   Widget barWidget;

  BarItem({this.text, this.iconData, this.color , this.barWidget});
}
