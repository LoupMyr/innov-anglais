// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:innov_anglais/class/test.dart';

void main() {
  test("api", () async {
    TestTools tool = TestTools();
    // var token = await tool.getToken();
    //print(token);
    /*expect(test, isNotNull);
    expect(test[0], isNotNull);
    Mot monmot = Mot.fromMap(test[0]);
    print(monmot.francais);
    print(monmot.anglais);*/
  });
}
