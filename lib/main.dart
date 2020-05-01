import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //const=>likhne ke baad we cannot chnage this..
        title: const Text('Quiz App'),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_1280.jpg'),
              //fit property help us to fill the image as full as we want
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RaisedButton(
                    child: Text(
                      "START QUIZ GAME",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MainScreen()));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RaisedButton(
                    child: Text(
                      "LEVELS",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    color: Colors.deepPurple,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RaisedButton.icon(
                    label: Text(
                      "ABOUT US",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                    color: Colors.deepPurple,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RaisedButton.icon(
                  
                    label: Text(
                      "SHARE",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    color: Colors.deepPurple,
                    splashColor:Colors.yellow,
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: RaisedButton.icon(
                  onPressed: () {
                    print('Button Clicked.');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  label: Text(
                    'EXIT',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.red,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          )),
    );
  }
}
