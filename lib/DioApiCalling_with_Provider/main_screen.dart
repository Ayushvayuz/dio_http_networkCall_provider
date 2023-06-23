import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dio_api_call.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Api with Provider'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: apiProvider.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context , index){
                return Container(
                  child: Card(
                    elevation: 10,
                    child:Text(snapshot.data.toString())
                  ),
                );
              });
            }
          },
        ),
      ),
    );
  }
}
