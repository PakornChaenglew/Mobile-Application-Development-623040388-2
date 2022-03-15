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

  late String quest_name1;
  late bool quest_check1;
  late Color quest_color1;

  late String quest_name2;
  late bool quest_check2;
  late Color quest_color2;

  late String quest_name3;
  late bool quest_check3;
  late Color quest_color3;

  late String quest_name4;
  late bool quest_check4;
  late Color quest_color4;

  bool previous = false;
  Widget? nextPage;

  @override
  void initState() {
    super.initState();
    quest = widget.questlist[widget.num]["quest"];
    title = widget.questlist[widget.num]["title"];
    imgUrl = widget.questlist[widget.num]["imgUrl"];

    quest_name1 = widget.questlist[widget.num]["choice_1_name"];
    quest_check1 = widget.questlist[widget.num]["choice_1_check"];

    quest_name2 = widget.questlist[widget.num]["choice_2_name"];
    quest_check2 = widget.questlist[widget.num]["choice_2_check"];

    quest_name3 = widget.questlist[widget.num]["choice_3_name"];
    quest_check3 = widget.questlist[widget.num]["choice_3_check"];

    quest_name4 = widget.questlist[widget.num]["choice_4_name"];
    quest_check4 = widget.questlist[widget.num]["choice_4_check"];

    if (widget.num > 1 && widget.num <= widget.questlist.length) {
      previous = true;
    }
    if (widget.num < widget.questlist.length) {
      nextPage = QuestShowing(num: widget.num + 1, questlist: widget.questlist,);
    }
  }

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
                            TapboxA(name: Text(quest_name1), check: quest_check1, FColor: Colors.orange),
                            TapboxA(name: Text(quest_name2), check: quest_check2, FColor: Colors.pinkAccent)
                          ],
                        ),
                      )),
                      Expanded( child: Center(
                        child:
                        Column(
                          children: [
                            TapboxA(name: Text(quest_name3), check: quest_check3, FColor: Colors.purpleAccent),
                            TapboxA(name: Text(quest_name4), check: quest_check4, FColor: Colors.lightBlueAccent),
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
  const TapboxA({Key? key, required this.name, required this.check, required this.FColor}) : super(key: key);

  final Text name;
  final Color FColor;
  final bool check;

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  var TColor;
  var TextCheck = "";

  _TapboxAState();

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  void colorcheck(){
    if (widget.check == true){
      TColor = Colors.green;
      TextCheck = "1";
    }
    else{
      TColor = Colors.red;
      TextCheck = "0";
    }
  }

  Widget build(BuildContext context){
    colorcheck();
    return Container(
        margin:const EdgeInsets.only(left: 7.5, top: 3.0, right: 7.5, bottom: 3),
        child: GestureDetector(
            onTap: () {
              _handleTap();
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
