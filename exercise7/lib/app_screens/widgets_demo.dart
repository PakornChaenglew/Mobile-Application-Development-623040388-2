import 'package:flutter/material.dart';
import 'person_image.dart';
import 'flight_bookbutton.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, top: 40.0, right: 10, bottom: 40),
        alignment: Alignment.center,
        color: Colors.black38,
        child: Column(
          children: <Widget>[
          Row(
            children: const <Widget>[
              Expanded(child:
                Text("Pakorn Chaenglew",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    textBaseline: TextBaseline.ideographic,
                    color: Colors.pinkAccent
                  ),
                    strutStyle: StrutStyle(
                      fontSize: 16.0,
                      height: 1.3,
                    )
                )),
              Expanded(child:
                Text(" 623-040-3882"
                    " 00000000000",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                      textBaseline: TextBaseline.ideographic,
                    color: Colors.pinkAccent
                  ),
                    strutStyle: StrutStyle(
                      fontSize: 16.0,
                      height: 1.3,
                    )
                )
              ),
            ],
          ),
            Row(
              children: const <Widget>[
                Expanded(child:
                Text("Photo Credit:",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                )),
                Expanded(child:
                Text(" Krit Walker",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,

                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                )),
              ],
            ),
            const FlightImageAsset(),
            const FlightBookButton()
          ]
        ),
      ),
    );
  }
}