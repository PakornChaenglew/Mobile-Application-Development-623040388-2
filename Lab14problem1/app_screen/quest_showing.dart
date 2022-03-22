import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestShowing extends StatefulWidget {
   QuestShowing({Key? key, required this.num, required this.questlist}) : super(key: key);

  final int num;
  final Map<dynamic, dynamic> questlist;

  @override
  _QuestShowingState createState() => _QuestShowingState();
}

class _QuestShowingState extends State<QuestShowing> {
  late String quest;
  late String title;
  late String imgUrl;

  late bool quest_check1;

  late bool quest_check2;

  late bool quest_check3;

  late bool quest_check4;


  late List choiselist;

  late bool checkchoise;

  bool previous = false;
  Widget? nextPage;

  @override
  void initState() {
    super.initState();
    quest = widget.questlist[widget.num]["quest"];
    title = widget.questlist[widget.num]["title"];
    imgUrl = widget.questlist[widget.num]["imgUrl"];
    choiselist = widget.questlist[widget.num]["choiselist"];

    quest_check1 = widget.questlist[widget.num]["choice_1_check"];
    quest_check2 = widget.questlist[widget.num]["choice_2_check"];
    quest_check3 = widget.questlist[widget.num]["choice_3_check"];
    quest_check4 = widget.questlist[widget.num]["choice_4_check"];

    if (widget.num > 1 && widget.num <= widget.questlist.length) {
      previous = true;
    }
    if (widget.num < widget.questlist.length) {
      nextPage = QuestShowing(num: widget.num + 1, questlist: widget.questlist,);
    }
  }

  void Szxc()=> false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: Text(quest, style: const TextStyle(fontSize: 30.0, color: Colors.deepOrangeAccent)),),
            Container(
              margin: const EdgeInsets.all(30),
                child: Image(image: NetworkImage(imgUrl), width: 200, height: 200)),
            Expanded(
                child: Center( child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded( child: Center(
                        child:
                        Column(
                          children:[
                            TapboxA(
                              name: Text(choiselist[0]),
                              check: quest_check1, FColor:
                            Colors.orange, num: widget.num,
                              questlist: widget.questlist,),
                            TapboxA(
                                name: Text(choiselist[1]),
                                check: quest_check2,
                                FColor: Colors.pinkAccent,
                                num: widget.num, questlist: widget.questlist)
                          ],
                        ),
                      )),
                      Expanded( child: Center(
                        child:
                        Column(
                          children: [
                            TapboxA(
                                name: Text(choiselist[2]),
                                check: quest_check3, FColor:
                            Colors.purpleAccent, num: widget.num,
                                questlist: widget.questlist),
                            TapboxA(
                                name: Text(choiselist[3]),
                                check: quest_check4,
                                FColor: Colors.lightBlueAccent,
                                num: widget.num, questlist: widget.questlist),
                          ],
                        ),
                      )),
                    ],
                  ))
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: previous, 
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("Previous"),
                        )
                    ),
                    ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text("Home"),
                    ),
                    Visibility(
                        visible: nextPage != null,
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    nextPage ?? Container()
                            )
                          ),
                          child: const Text("Next"),
                        )
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}


class TapboxA extends StatefulWidget {
  const TapboxA({Key? key, required this.name, required this.check, required this.FColor, required this.num, required this.questlist}) : super(key: key);

  final Text name;
  final Color FColor;
  final bool check;
  final num;
  final questlist;

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  var TColor;
  var TextTitle = "";
  var Textcontent = "";
  var function;

  _TapboxAState();

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  void colorcheck(){
    if (widget.check == true){
      TColor = Colors.green;
    }
    else{
      TColor = Colors.red;
    }
  }

  Widget? nextPage;

  void _some(BuildContext context){
    nextPage = QuestShowing(num: widget.num + 1, questlist: widget.questlist,);
    if (widget.check == true) {
      if (widget.num < widget.questlist.length) {
        TextTitle = "Score!";
        Textcontent = "Congrats, you get ${widget.num} point";
        function = ElevatedButton(child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                      nextPage ?? Container()
                  )
              );
            });
      }
      else {
        TextTitle = "Score!";
        Textcontent = "Congrats, you get ${widget.num} point";
        function = ElevatedButton(child: const Text("OK"),
            onPressed: () {
              Navigator.pushNamed(context, '/restart');
            });
      }
    }
    else{
      TextTitle = "Score!";
      Textcontent = "Sorry, you miss it";
      function = ElevatedButton(child: const Text("OK"),
          onPressed: () {
            Navigator.pushNamed(context, '/restart');
          });
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(TextTitle),
            content: Text(Textcontent),
            actions: <Widget>[
              function
            ],
          );
        }
    );
  }

  Widget build(BuildContext context){
    colorcheck();
    return Container(
        margin:const EdgeInsets.only(left: 7.5, top: 3.0, right: 7.5, bottom: 3),
        child: GestureDetector(
            onTap: () {
              _handleTap();
              _some(context);
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" Your Score is $TextCheck"), duration: const Duration( seconds: 1),));
            } ,
            child:SizedBox(
                width: 300, height: 70,
                child:
                DecoratedBox(
                    decoration: BoxDecoration(color: _active ? TColor:widget.FColor),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5, left: 30, right: 30),
                            child: Center( child: widget.name),
                          )
                        ])
                )
            )));
  }
}
