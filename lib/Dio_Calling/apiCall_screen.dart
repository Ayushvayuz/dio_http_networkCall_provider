import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonList;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio()
          .get('https://protocoderspoint.com/jsondata/superheros.json');
      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data['superheros'] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dio Api Call',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
          itemCount: jsonList == null ? 0 : jsonList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      jsonList[index]['url'],
                      fit: BoxFit.fill,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  title: Text(jsonList[index]['name']),
                  subtitle: Text(jsonList[index]['power']),
                ));
          }),
    );
  }
}
