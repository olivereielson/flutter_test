import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interview_project/secondpage.dart';

import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Input inputdata = Input("", "", "", 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                floatingLabelStyle: const TextStyle(color: CupertinoColors.black),
                labelText: "First Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                inputdata.fname = text;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.grey,
                focusColor: Colors.grey,
                floatingLabelStyle: const TextStyle(color: CupertinoColors.black),
                labelText: "Last Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (text) {
                inputdata.lname = text;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                fillColor: Colors.orange,
                focusColor: Colors.grey,
                floatingLabelStyle: const TextStyle(color: CupertinoColors.black),
                labelText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (test){
                inputdata.email=test;
              },
              onFieldSubmitted: (text) {
                if (EmailValidator.validate(text)) {
                  inputdata.email = text;
                } else {
                  AlertDialog alert = AlertDialog(
                    title: const Text("Error"),
                    content: const Text("Please enter a valid Email"),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Ok"),
                      ),
                    ],
                  );
                  // show the dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                focusColor: Colors.grey,
                floatingLabelStyle: const TextStyle(color: CupertinoColors.black),
                labelText: "Age",
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: CupertinoColors.activeBlue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (number) {
                inputdata.age = int.parse(number);
              },
            ),
            Center(
              child: CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  child: const Text("Submit"),
                  onPressed: () {
                    if (inputdata.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondPage(inputdata)),
                      );
                    }else{
                      AlertDialog alert = AlertDialog(
                        title: const Text("Error"),
                        actions: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Ok"),
                          ),
                        ],
                      );
                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );

                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
