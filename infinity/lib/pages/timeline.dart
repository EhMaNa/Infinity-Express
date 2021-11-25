import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:infinity/pages/destination.dart';

class Timeline extends StatefulWidget {
  @override
  _Timeline createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
  List imgList = [
    'assets/infinity1.jpg',
    'assets/infinity2.jpg',
    'assets/infinity3.jpg',
    'assets/infinity5.jpg',
    'assets/infinity7.jpg',
    'assets/infinity8.jpg',
    'assets/infinity4.jpg',
    'assets/infinity6.jpg'
  ];

  late List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.fitHeight, ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                           padding: EdgeInsets.symmetric( horizontal: 10.0),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 70),
          child: CarouselSlider(
          
            options: CarouselOptions(
               height: 400.0, autoPlay: true, enlargeCenterPage: true, autoPlayAnimationDuration: Duration(seconds: 2)),
            items: imageSliders,
          ),),
          TextButton(onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Destination())), child: 
          Text("Welcome To Infinity Services")
          ),
          /*FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/infinity1.jpg', ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),*/
          /* FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),*/
        ],
      ),
    );
  }
}
