import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Booking extends StatefulWidget {
  const Booking({ Key? key }) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Text('Choose a Seat',
            style: TextStyle(
                color: Colors.black,
              letterSpacing: 2.0
            ),),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            ),
        ),

        body: Container(
          child: Center(
            child: TabBarView(
              children: [
                ListView(
                  physics: BouncingScrollPhysics(),
                  children: [

                    Row(
                      children: [
                        SeatWidget(name: '1', color: Colors.red),
                        SeatWidget(name: '2', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '3', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '4', color: Colors.red),
                        SeatWidget(name: '5', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '6', color: Colors.red),
                        SeatWidget1(),

                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '7', color: Colors.red),
                        SeatWidget(name: '8', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '9', color: Colors.red),
                        SeatWidget1(),

                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '10', color: Colors.red),
                        SeatWidget(name: '11', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '12', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '13', color: Colors.red),
                        SeatWidget(name: '14', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '15', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '16', color: Colors.red),
                        SeatWidget(name: '17', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '18', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '19', color: Colors.red),
                        SeatWidget(name: '20', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '21', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '22', color: Colors.red),
                        SeatWidget(name: '23', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '24', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '25', color: Colors.red),
                        SeatWidget(name: '26', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '27', color: Colors.red),
                        SeatWidget1(),
                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '28', color: Colors.red),
                        SeatWidget(name: '29', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '30', color: Colors.red),
                        SeatWidget1(),

                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '31', color: Colors.red),
                        SeatWidget(name: '32', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '33', color: Colors.red),
                        SeatWidget1(),

                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '34', color: Colors.red),
                        SeatWidget(name: '35', color: Colors.red),
                        Spacer(),
                        SeatWidget(name: '36', color: Colors.red),
                        SeatWidget1(),

                      ],
                    ),
                    Row(
                      children: [
                        SeatWidget(name: '37', color: Colors.red),
                        SeatWidget(name: '38', color: Colors.red),
                        SeatWidget(name: '39', color: Colors.red),
                        SeatWidget(name: '40', color: Colors.red),

                      ],
                    ),
                  ],
                ),
               /* Container(
                  child: Center(child: Text('Available')),
                ),*/
              ],
            ),
          ),
        ),


      ),
    );
  }
}

class SeatWidget extends StatefulWidget {
  String? name;
  Color? color;


   SeatWidget({this.name, this.color});

  @override
  _SeatWidgetState createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5 - 4;
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.color = widget.color == Colors.red ? Colors.yellow : Colors.red;
        });
      },
      child: Container(
        margin: EdgeInsets.all(2.0),
        width: width,
        height: width / 1.5,
        color: widget.color,
        child: Center(
            child: Text(widget.name.toString(),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                color: Colors.white))),
      ),
    );
  }
}

class SeatWidget1 extends StatefulWidget {
  final String? name;
  final Color? color;


  SeatWidget1({this.name = "", this.color=Colors.transparent});

  @override
  _SeatWidget1State createState() => _SeatWidget1State();
}

class _SeatWidget1State extends State<SeatWidget1> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5 - 4;
    return Container(
      margin: EdgeInsets.all(2.0),
      width: width,
      height: width / 1.5,
      color: widget.color,
      child: Center(
          child: Text(widget.name.toString(),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }
}

