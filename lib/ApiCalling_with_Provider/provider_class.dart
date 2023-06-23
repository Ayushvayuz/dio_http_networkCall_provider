import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../Http_Calling/model_Class.dart';

class ProviderApi with ChangeNotifier{
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
    notifyListeners();
  }
}