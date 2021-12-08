import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:infinity/models/student.dart';
import 'package:infinity/widgets/book_with_infinity.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Timeline extends StatefulWidget {
  @override
  _Timeline createState() => _Timeline();
}

Person person = Person();

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
                      Image.asset(
                        item,
                        fit: BoxFit.fitHeight,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
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
      body: Stack(fit: StackFit.expand, children: [
        _buildBackground(context),
        new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 80, right: 100),
              child: Container(
                child: Text(
                  ' Hello Darius Twuamsi-Ankrah! ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 20),
                child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                  WavyAnimatedText("Welcome To Infinty Transport",
                      textAlign: TextAlign.center,
                      textStyle: TextStyle(fontSize: 20))
                ])),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayAnimationDuration: Duration(seconds: 2)),
                items: imageSliders,
              ),
            ),
            BookWithUs()
          ],
        ),
      ]),
    );
  }

  Widget _buildBackground(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String halpEllipsePath =
        'M-48.35,33.095C-21.509,2.145 17.176,-16.352 59.126,-14.058C134.541,-9.932 192.134,59.835 187.659,141.645C183.184,223.454 118.325,286.524 42.91,282.398C6.777,280.422 -25.266,263.376 -48.35,237.156L-48.35,33.095Z';

    var pathPrinter = new PathBuilder();
    writeSvgPathDataToPath(halpEllipsePath, pathPrinter);
    var paint = new Paint()
      ..strokeWidth = 45.0
      ..shader = Gradients.aliHussien
          .createShader(Rect.fromLTWH(0.0, 0.0, 100.0, 300.0))
      ..style = PaintingStyle.stroke;

    return Transform.scale(
        scale: 1.75,
        child: Transform.translate(
            offset: Offset(width / 6, height / 4),
            child: CustomPaint(
                painter:
                    new PathPainter(p: pathPrinter.path, redPainter: paint))));
  }
}

class PathPainter extends CustomPainter {
  final Path p;

  final Paint redPainter;

  const PathPainter({required this.p, required this.redPainter});

  @override
  bool shouldRepaint(PathPainter old) => true;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(p, redPainter);
  }
}

class PathBuilder extends PathProxy {
  var path = Path();
  @override
  void close() {
    path.close();
  }

  @override
  void cubicTo(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    path.cubicTo(x1, y1, x2, y2, x3, y3);
  }

  @override
  void lineTo(double x, double y) {
    path.lineTo(x, y);
  }

  @override
  void moveTo(double x, double y) {
    path.moveTo(x, y);
  }
}
