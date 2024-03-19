import 'package:calculater/main.dart';
import 'package:flutter/material.dart';

import 'cashchart.dart';

class App_Text {
  static TextEditingController usernumber = TextEditingController();
  static TextEditingController usernumber6 = TextEditingController();
  static Second app=Second();
  // static Stri
  static MyHomePage w1 = MyHomePage(
    title: "",
    amount: "500",
  );
  static MyHomePage w2 = MyHomePage(
    title: "",
    amount: "200",
  );
  static MyHomePage w3 = MyHomePage(
    title: "",
    amount: "100",
  );
  static MyHomePage w4 = MyHomePage(
    title: "",
    amount: "50",
  );
  static MyHomePage w5 = MyHomePage(
    title: "",
    amount: "20",
  );
  static MyHomePage w6 = MyHomePage(
    title: "",
    amount: "10",
  );
  static String getTotal() {
    int total = 0;
    try {
      total += int.tryParse(w1.getResult())!;
    } catch (e) {}

    try {
      total += int.tryParse(w2.getResult())!;
    } catch (e) {}

    try {
      total += int.tryParse(w3.getResult())!;
    } catch (e) {}

    try {
      total += int.tryParse(w4.getResult())!;
    } catch (e) {}

    try {
      total += int.tryParse(w5.getResult())!;
    } catch (e) {}

    try {
      total += int.tryParse(w6.getResult())!;
    } catch (e) {}


    return total.toString();
  }
}
