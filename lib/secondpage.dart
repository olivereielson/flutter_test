import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class SecondPage extends StatefulWidget {
  SecondPage(this.inputdata, {super.key});
  Input inputdata;

  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Data",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),

                  IconButton(onPressed: (){

                    Navigator.pop(context);

                  }, icon: Icon(Icons.home))

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
                child: Table(
                  border: TableBorder.all(),
                  defaultColumnWidth: const FixedColumnWidth(200.0),


                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                  children: <TableRow>[

                    TableRow(
                      children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(child: Text(widget.inputdata.fname)),
                       ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(widget.inputdata.lname)),
                        ),

                      ],
                    ),
                    TableRow(
                      decoration: const BoxDecoration(
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(widget.inputdata.age.toString())),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Text(widget.inputdata.email)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
