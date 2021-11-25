import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinity/pages/destination.dart';
import 'package:infinity/pages/tickets.dart';
import 'package:infinity/pages/timeline.dart';

const Color kRed = Colors.red;
const Color kBlack = Colors.black;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int notificationCounter = 0;
  late ScrollController controller;
  int pageIndex = 0;
  late PageController _pageController;
  final List<Widget> _pages = [
    Timeline(),
    Destination(),
    Tickets(),
  ];

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: kBottomNavigationBarHeight,
              margin: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: MediaQuery.of(context).size.width / 10,
              ),
              decoration: BoxDecoration(
                  color: kBlack,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    color: pageIndex == 0 ? kRed : Colors.grey,
                    icon: Icon(CupertinoIcons.home),
                    onPressed: () => onPageChanged(0),
                  ),
                  IconButton(
                    color: pageIndex == 1 ? kRed : Colors.grey,
                    icon: Icon(CupertinoIcons.bus),
                    onPressed: () => onPageChanged(1),
                  ),
                  IconButton(
                    color: pageIndex == 2 ? kRed : Colors.grey,
                    icon: Icon(CupertinoIcons.tickets),
                    onPressed: () => onPageChanged(2),
                  ),
                  IconButton(
                    color: pageIndex == 3 ? kRed : Colors.grey,
                    icon: Icon(CupertinoIcons.info_circle),
                    onPressed: () => onPageChanged(2),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
      _pageController.jumpToPage(pageIndex);
    });
  }
}
