import 'package:flutter/material.dart';
import 'package:lab13p1/app_screen/quest_showing.dart';
import 'package:lab13p1/main.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(5),
            child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 200),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(image: AssetImage('lib/app_screen/quiz.jpg'), height: 200, width: 200,),
                            Text("Welcome to the Quiz App",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
                            Text("By Pakorn Chaenglew 623040388-2",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.pinkAccent)),
                          ]
                      )
                  ),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/second');
                                  },
                                child: const Text("Start")
                            )
                          ]
                      )
                  )
                ]
            )
        )
      ),
    );
  }
}

class Restart extends StatelessWidget {
  const Restart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CountScore>(builder: (context, provider, child){
      return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                    children: [
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Your Total Score is ${provider.x}",
                                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                      provider.reset();
                                    },
                                    child: const Text("Restart")
                                )
                              ]
                          )
                      )
                    ]
                )
            )
        ),
      );
    });
  }
}

