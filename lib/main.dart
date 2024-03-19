import 'package:calculater/utilites.dart';
import 'package:flutter/material.dart';

import 'cashchart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: App_Text.app,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.amount});
  String amount;
  String multiplier="";
  String result = "0";
  String output="";

  final String title;
  String getResult() {
    return result;
  }
String getOutput()
{
  String answer="$amount  X  $multiplier = $result";
  return answer;
}
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Text(widget.output),
              Expanded(
                flex: 1,
                child: Text(
                  widget.amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                flex: 1,
                child: const Text("x",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(
                width: 80,
                child: Center(
                  child: TextField(
                    autofocus: true,
                    // controller: App_Text.usernumber,
                    onChanged: (String value) {
                      try {
                        int r =
                            int.parse(value) * int.parse(widget.amount);
                        if (r < 0) {
                          throw Exception("0");
                        }
                        widget.result = r.toString();
                      } catch (e) {
                        widget.result = "0";
                        // App_Text.app.setState();
                      }
                      widget.output=widget.getOutput();
                      setState(() {
                        App_Text.app.ShowTotal();
                      });
                      print(value);
                      widget.multiplier=value;
                    },
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.teal,
                          width: 1.5,
                        ),
                      ),

                      //********Focus border like hover******************8
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          )),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              const Expanded(
                flex: 1,
                child: Text("=",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Expanded(
                flex: 1,
                child: Text(widget.result,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
