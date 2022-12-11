// ignore_for_file: sort_child_properties_last,, use_build_context_synchronously
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Robot App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

Future getProfileInfo(String ID, String typeOf) async {
  http.Response response = await http.post(
      Uri.parse("http://192.168.0.100:8000/getProfileInfo"),
      body: {"ID": ID, "type": typeOf});

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Error loading data");
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Start'),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            width: 100,
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: const Text('Stop'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
