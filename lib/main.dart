import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Quiz App'),
    );
  }
}

//* Our actual app
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State  is the data that changes
  List<Icon> scoreIcons = [];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            Center(
                child: Text(qMap.keys.toList()[currentIndex],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 35, color: Colors.white))),
            const Spacer(),
            // ! True Button
            ElevatedButton(
              onPressed: () {
                checkAnswers(true);
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: Colors.green,
                shape: const RoundedRectangleBorder(),
                minimumSize: const Size(150, 60), //////// HERE
              ),
              child: const Text("True",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),

            const SizedBox(
              height: 12,
            ),
            // ! False Button
            ElevatedButton(
              onPressed: () {
                checkAnswers(false);
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: Colors.red,
                shape: const RoundedRectangleBorder(),
                minimumSize: const Size(150, 60),
              ),
              child: const Text("False",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),

            const SizedBox(
              height: 16,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: scoreIcons,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  // Your Logic
  void checkAnswers(bool buttonValue) {
    // Check for score
    if (scoreIcons.length < qMap.entries.length) {
      print("Button Value : $buttonValue");
      print("Right Answer : $currentIndex}");
      if (buttonValue == qMap.values.toList()[currentIndex]) {
        // Add Check Icon
        scoreIcons.add(
          const Icon(Icons.check, color: Colors.green),
        );
      } else {
        // Add False Icon
        scoreIcons.add(
          const Icon(Icons.close, color: Colors.red),
        );
      }
    }

    // Check for questions
    if (currentIndex < qMap.entries.length - 1) {
      // * State Changes
      // Increase the index to get the next question
      currentIndex++;
    }

    // Tell Flutter  to change the ui based on the state changes above
    setState(() {});
  }
}
