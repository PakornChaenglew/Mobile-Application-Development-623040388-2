import 'package:flutter/material.dart';
import 'quest_showing.dart';

class QuestInfo extends StatefulWidget {
  const QuestInfo({Key? key}) : super(key: key);

  @override
  _QuestInfoState createState() => _QuestInfoState();
}

class _QuestInfoState extends State<QuestInfo> {
  var quest_list = {
    1: {
      "quest": "Who is she?",
      "title": "First Quest",
      "imgUrl": "https://i1.sndcdn.com/artworks-olAl0lTzNSuA04BV-9XoACw-t500x500.jpg",

      "choice_1_check": true,
      "choice_2_check": false,
      "choice_3_check": false,
      "choice_4_check": false,

      "choiselist":["Inugami Korone", "Calliope Mori", "Nekomata Okayu", "Gawr Gura"]
    },
    2: {
      "quest": "Who is she?",
      "title": "Second Quest",
      "imgUrl": "https://yt3.ggpht.com/QpBZJlfms1FeCXe6UefUykA9a8M7Atb7w8j6sOpk6DkDgCL1vkUGCmmXyob5Kv78lLnkWsuU=s900-c-k-c0x00ffffff-no-rj",

      "choice_1_check": false,
      "choice_2_check": false,
      "choice_3_check": false,
      "choice_4_check": true,

      "choiselist":["Inugami Korone", "Calliope Mori", "Nekomata Okayu", "Gawr Gura"]
    },
    3: {
      "quest": "Who is she?",
      "title": "Third Quest",
      "imgUrl": "https://static.wikia.nocookie.net/virtualyoutuber/images/3/35/Nekomata_Okayu_img.png/revision/latest/top-crop/width/360/height/450?cb=20190405185910",

      "choice_1_check": false,
      "choice_2_check": false,
      "choice_3_check": true,
      "choice_4_check": false,

      "choiselist":["Inugami Korone", "Calliope Mori", "Nekomata Okayu", "Gawr Gura"]
    }
  };

  @override
  Widget build(BuildContext context) {
    return QuestShowing(num: 1, questlist: quest_list);
  }
}
