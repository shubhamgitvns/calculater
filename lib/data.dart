import 'dart:io';

import 'package:calculater/utilites.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Show_Data extends StatefulWidget {
  const Show_Data({super.key});

  @override
  State<Show_Data> createState() => _Show_DataState();
}

class _Show_DataState extends State<Show_Data> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  "Data",
                  style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.indigo,
                      height: 50,
                      width: 300,
                      child: const Center(
                          child: Text(
                        "Show Data",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  ),
                  onTap: () async {
                    Directory root =
                        await getTemporaryDirectory(); // this is using path_provider

                    String directoryPath = root.path + '';

                    var file = File('$directoryPath/file.txt');

                    File('$directoryPath/file.txt')
                        .readAsString()
                        .then((String contents) {
                      data = "$contents\n${App_Text.getTotal()}";
                      print("Read $contents");
                      setState(() {});
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
