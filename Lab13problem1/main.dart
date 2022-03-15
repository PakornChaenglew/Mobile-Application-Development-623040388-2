import 'package:flutter/material.dart';
import 'app_screen/main_screen.dart';
import 'app_screen/all_quests.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "KKU Quest",
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const MainScreen(),
//         '/second': (context) => const QuestInfo()
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "KKU Quest",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuestInfo(),
      ),
    );
  }
}
