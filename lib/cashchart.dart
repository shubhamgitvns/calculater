import 'package:calculater/data.dart';
import 'package:calculater/utilites.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'main.dart';

class Second extends StatefulWidget {
  Second({super.key});
  _SecondState _state = _SecondState();

  String total = "0";
  @override
  State<Second> createState() {
    _state = _SecondState();
    return _state;
  }

  void ShowTotal() {
    _state.setState(() {
      total = App_Text.getTotal();
    });
  }
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Cash Counter",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            App_Text.w1,
            App_Text.w2,
            App_Text.w3,
            App_Text.w4,
            App_Text.w5,
            App_Text.w6,
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(
                      child: Text("=",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Text(widget.total,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.indigo,
                    height: 50,
                    child: Center(
                        child: Text(
                      "Save",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
                onTap: () async {
                  print("Written");
                  Directory root =
                      await getTemporaryDirectory(); // this is using path_provider

                  String directoryPath = root.path + '';

                  var file = File('$directoryPath/file.txt');
                  var sink = file.openWrite();
                  String datatowrite = "";
                  datatowrite += App_Text.w1.getOutput();
                  datatowrite += "\n" + App_Text.w2.getOutput();
                  datatowrite += "\n" + App_Text.w3.getOutput();
                  datatowrite += "\n" + App_Text.w4.getOutput();
                  datatowrite += "\n" + App_Text.w5.getOutput();
                  datatowrite += "\n" + App_Text.w6.getOutput();

                  sink.write(datatowrite);

                  // Close the IOSink to free system resources.
                  sink.close();
                  print("Written Done");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Show_Data()));
                },
              ),
            )

            // ElevatedButton(
            //     onPressed: () async {
            //       print("Read");
            //       Directory root =
            //       await getTemporaryDirectory(); // this is using path_provider
            //
            //       String directoryPath = root.path + '';
            //
            //       var file = File('$directoryPath/file.txt');
            //
            //       File('$directoryPath/file.txt').readAsString().then((String contents) {
            //         print("Read $contents");
            //       });
            //       print("Read");
            //     },
            //     child: Text("read")),
            // ElevatedButton(
            //     onPressed: () async {
            //       print("Written");
            //       Directory root =
            //       await getTemporaryDirectory(); // this is using path_provider
            //
            //       String directoryPath = root.path + '';
            //
            //       var file = File('$directoryPath/file.txt');
            //       var sink = file.openWrite();
            //       sink.write('FILE ACCESSED ${DateTime.now()}\n');
            //
            //       // Close the IOSink to free system resources.
            //       sink.close();
            //       print("Written Done");
            //     },
            //     child: Text("write"))
          ],
        ),
      ),
    );
  }
}
