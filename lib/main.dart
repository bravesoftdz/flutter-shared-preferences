import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/home_page.dart';
import 'package:flutter_shared_preferences/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool flag = await getVisitingFlag();
            setVisitingFlag();
            if (flag) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WelcomePage()));
            }
          },
          child: Text('Click'),
        ),
      ),
    );
  }
}

setVisitingFlag() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool('alreadyVisited', true);
}

getVisitingFlag() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool alreadyVisited = sharedPreferences.getBool('alreadyVisited') ?? false;
  return alreadyVisited;
}
