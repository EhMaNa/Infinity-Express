import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Timeline extends StatefulWidget {
  @override
  _Timeline createState() => _Timeline();
}

class _Timeline extends State<Timeline> {
   List<String> imgList = [
    'assets/images/infinity1.jpg',
     'assets/images/infinity2.jpg',
    'assets/images/infinity3.jpg',
     'assets/images/infinity5.jpg',
     'assets/images/infinity7.jpg',
     'assets/images/infinity4.jpg',
     'assets/images/infinity6.jpg'
  ];

   late List<Widget> imageSliders = imgList
      .map((item) => Container(
    child: Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
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
          CarouselSlider(
            options: CarouselOptions(
                height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true),
            items: imageSliders,
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
