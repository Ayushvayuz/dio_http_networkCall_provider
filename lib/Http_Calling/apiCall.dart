import 'dart:convert';

import 'package:flutter/material.dart';

import 'model_Class.dart';
import 'package:http/http.dart' as http;
class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<ModelClass> list = [];
  Future getPage() async{
    try{
      var url = "https://jsonplaceholder.typicode.com/posts";
      var response =await http.get(Uri.parse(url));
      var data = jsonDecode(response.body);
      print('${data}');
      if(response.statusCode==200){
        for(Map<String,dynamic> i in data){
          list.add(ModelClass.fromJson(i));
        }
      }
    }on Exception catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api call'),
      ),
      body: FutureBuilder(
        future: getPage(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.builder(
            itemCount: list.length,
              itemBuilder: (context,index){
            return Container(
              height: 100,
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(list[index].id.toString(),),
                        Text(list[index].title.toString(),textWidthBasis: TextWidthBasis.longestLine,),

                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        },),
    );
  }
}
