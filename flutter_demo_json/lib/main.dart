import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_demo_json/order.dart';

void main() => runApp(MyApp());

const jsonString = '''
{
  "orderId": 123456,
  "user": {
    "fullName": "Trung Vu",
    "email": "wtrungvu@gmail.com"
  },
  "products": [
    {
      "productId": 123,
      "productName": "iPhone",
      "quantity": 10,
      "price": 300.123
    },
    {
      "productId": 456,
      "productName": "Macbook",
      "quantity": 5,
      "price": 600.000
    },
    {
      "productId": 789,
      "productName": "iPad",
      "quantity": 25,
      "price": 50.000
    }
  ]
}
''';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Demo JSON"),
        ),
        body: JsonInfo(),
      ),
    );
  }
}

class JsonInfo extends StatefulWidget {
  @override
  _JsonInfoState createState() => _JsonInfoState();
}

class _JsonInfoState extends State<JsonInfo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: RaisedButton(
          child: Text("Click me to show data"),
          onPressed: () {
            Map<String, dynamic> map = jsonDecode(jsonString);

            // print("orderId = " + map['orderId'].toString());

            var order = Order.fromJson(map);

            print(order.orderId);
            print(order.user.email);
            print(order.user.fullName);

            print("======= Products ========");

            order.products.forEach((product) {
              print(product.productName);
              print("---------------");
            });
          },
        ),
      ),
    );
  }
}
