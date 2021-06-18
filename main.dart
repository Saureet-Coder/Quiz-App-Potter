import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyQuizApp(),
    );
  }
}

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({Key? key}) : super(key: key);

  @override
  _MyQuizAppState createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  List<Map<String, dynamic>> allQ = [
    {
      "question": "Who is 1 day older than Harry Potter?",
      "options": [
        "Hermione Granger",
        "Dean Thomas",
        "Neville Longbottom",
        "Dudley Dursley",
      ],
      "correctAnswer": "Neville Longbottom",
    },
    {
      "question":
          "Who blocks all the letter to be delivered to harry In Chambers Of Secret?",
      "options": [
        "Uncle Vernon",
        "Dobby",
        "Lord Voldemort",
        "None of these",
      ],
      "correctAnswer": "Dobby",
    },
    {
      "question": "Who uses a umbrella instead of wand",
      "options": [
        "Lucious Malfoy",
        "Kreacher",
        "Hagrid",
        "None of these",
      ],
      "correctAnswer": "Hagrid",
    },
    {
      "question": "Who wrote the History Of Magic Book",
      "options": [
        "Glideroy Lockhart",
        "Albus Dumbledore",
        "Nicholas Flamel",
        "None of these",
      ],
      "correctAnswer": "None of these",
    },
    {
      "question": "Which wizard did Albus Dumbledore Fears(not death)",
      "options": [
        "Severus Snape",
        "Lord Voldemort",
        "Gellert Grindlewald",
        "Himself",
      ],
      "correctAnswer": "Gellert Grindlewald",
    },
    {
      "question": "What is the term that rips soul into parts",
      "options": [
        "Hocruxes",
        "Avada Kedabra",
        "Part-soul snatcher",
        "Gryffindor's sword",
      ],
      "correctAnswer": "Hocruxes",
    },
    {
      "question": "Who is the first person who unite the hallows?",
      "options": [
        "Hermione Granger",
        "Albus Dumbledore",
        "Harry Potter",
        "Tom Riddle",
      ],
      "correctAnswer": "Harry Potter",
    },
    {
      "question": "Which charm make a person the secret Keeper",
      "options": [
        "Keeper Maxima charm",
        "Fidelius Charm",
        "Secreto Charm",
        "Memory charm",
      ],
      "correctAnswer": "Fidelius Charm",
    },
    {
      "question": "Who spend all of his/her life loving Lily Potter",
      "options": [
        "Harry Potter",
        "Sirius Black",
        "Severus Snape",
        "Petunia Dursley",
      ],
      "correctAnswer": "Severus Snape",
    },
    {
      "question": "Who is the person who is always bullied by James Potter",
      "options": [
        "Half Blood prince",
        "Snivellus",
        "Severus Snape",
        "All",
      ],
      "correctAnswer": "All",
    },
  ];

  // String question = "";
  // List<String> options = [
  //   "",
  //   "",
  //   "",
  //   "",
  // ];
  // String correctAnswer = "Neville Longbottom";
  int currentq = 0;
  int score = 0;

  check(String _option) {
    setState(() {
      if (_option == allQ[currentq]["correctAnswer"]) {
        score = score + 10;
      }
      // if (currentq < allQ.length - 1) {
      currentq++;
    });
  }

  restartGame() {
    setState(() {
      currentq = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Harry Potter Quiz App by Saureet"),
      ),
      body: currentq > allQ.length - 1
          ? Container(
              padding: EdgeInsets.all(60.0),
              child: Column(
                children: [
                  Icon(Icons.emoji_events, size: 128.0, color: Colors.amber),
                  Text(
                    "Score: " + score.toString(),
                    style: TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                      fontSize: 64.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      restartGame();
                    },
                    color: Colors.indigo,
                    minWidth: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Restart?",
                      style: TextStyle(
                        color: Colors.grey[100],
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.all(28.0),
              child: Column(
                children: [
                  Text(
                    "Q" + (currentq + 1).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    allQ[currentq]["question"],
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  for (String option in allQ[currentq]["options"])
                    Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          onPressed: () {
                            check(option);
                          },
                          color: Colors.blueAccent,
                          minWidth: double.infinity,
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            option,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
    );
  }
}
