import 'package:flutter/material.dart';
import './bottom_nav_bar.dart';
import './Pages/pageOne.dart';
import './Pages/PageTwo.dart';
import './Pages/pageThree.dart';
import './Pages/pageFour.dart';



class BottomNavBarContainer extends StatefulWidget{
  final List<BarItem> baritems = [
    BarItem(
      text: "Home", 
      iconData: Icons.home,
      color: Colors.indigo,
      barWidget: PageOne()
    ),
    BarItem(
      text: "Likes", 
      iconData: Icons.favorite_border,
      color: Colors.pinkAccent,
      barWidget: PageTwo()
    ),
    BarItem(
      text: "Search",
      iconData: Icons.search,
      color: Colors.yellow.shade900,
      barWidget: PageThree()
    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal,
      barWidget: PageFour()
    ),
  ];





  _BottomNavBarContainerState createState() =>
      _BottomNavBarContainerState();


  
}


class _BottomNavBarContainerState extends State<BottomNavBarContainer>{
  int selectedBarIndex = 0 ;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.baritems[selectedBarIndex].text),
        centerTitle: true,
        backgroundColor:widget.baritems[selectedBarIndex].color,
      ),
      body: AnimatedContainer(
        color: widget.baritems[selectedBarIndex].color,
        duration: Duration(milliseconds: 300),
        child: widget.baritems[selectedBarIndex].barWidget,
      ),
      bottomNavigationBar: BottomNavBar(
        barItems: widget.baritems,
        animationDuration: Duration(milliseconds: 150),
        barStyle: BarStyle(
          fontSize: 20.0,
          iconSize: 30.0,
        ),
        onBarTap: (index){
          setState(() {
           selectedBarIndex= index; 
          });
        },
      ),
    );
  }
}
