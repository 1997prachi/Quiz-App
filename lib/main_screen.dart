import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'dart:async';
import 'package:quizapp/models/quiz.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String url =
      'https://opentdb.com/api.php?amount=20&category=11&difficulty=medium&type=multiple';
  Quiz quiz;
  List<Results> results;
  @override
  Widget build(BuildContext context) {
    Future<void> fetchQuestion() async {
      var response = await http.get(url);
      var jsonData = json.decode(response.body);
      quiz = Quiz.fromJson(jsonData);
      results = quiz.results;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trivia',
          style: TextStyle(
            color: Colors.blueAccent[900],
            fontSize: 35,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: fetchQuestion,
        child: FutureBuilder(
          future: fetchQuestion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: getQuestionsList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  ListView getQuestionsList() {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          //(if i do this then after loading it shows me white Screen )
          elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
       shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    //     child: makeListTile,
   
           child: ExpansionTile(
             
             backgroundColor: Colors.black,
             
            //  leading:Icon(Icons.check_box) ,
            //  trailing: Icon(Icons.account_circle),
            // title: Column(
            //   children: <Widget>
            //   [
            title: ListTile(
              leading: Icon(Icons.check_box),
              // EdgeInsets.symmetric(horizontal: 16.0),

              title: Text(
                results[index].question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[200],
                  fontSize: 20.0,
                  fontFamily: "ALike",
                ),
              ),
              subtitle: Text(
                results[index].category,
                style: TextStyle(
                  backgroundColor: Colors.amberAccent[200],
                  fontSize: 10.0,
                  fontFamily: "ALike",
                ),
              ),
            ),
            children: results[index].allAnswers.map((option) {
              return AnswersWidget(results, index, option);
            }).toList(),
            // ],),
          ),
      ),
        );
      },
    );
  }
}

class AnswersWidget extends StatefulWidget {
  final List<Results> results;
  final int index;
  final String option;

  AnswersWidget(this.results, this.index, this.option);

  @override
  _AnswersWidgetState createState() => _AnswersWidgetState();
}

class _AnswersWidgetState extends State<AnswersWidget> {
  Color tick;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          if (widget.option == widget.results[widget.index].correctAnswer) {
            tick = Colors.blue;
          } else {
            tick = Colors.red;
          }
        });
      },
      title: Text(
        widget.option,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: tick,
          backgroundColor: Colors.amberAccent[200],
          fontSize: 20.0,
          fontFamily: "ALike",
        ),
        // background: Colors.deepPurple,
        //             elevation: 10.0,
        //             splashcolor:Colors.amber,
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(50.0)),
      ),
     
    );
  }
}
