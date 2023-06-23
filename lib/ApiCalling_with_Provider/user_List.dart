import 'package:dio_network_calling/ApiCalling_with_Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProviderApiCall extends StatefulWidget {
  const ProviderApiCall({Key? key}) : super(key: key);
  @override
  State<ProviderApiCall> createState() => _ProviderApiCallState();
}

class _ProviderApiCallState extends State<ProviderApiCall> {
  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ProviderApi>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('api call',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: list.getPage(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return ListView.builder(
              itemCount: list.list.length,
              itemBuilder: (context,index){
                return Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('${list.list[index].id.toString()}  '),
                            SizedBox(width: 8,),
                            Expanded(child: Text(list.list[index].title.toString(),
                              textWidthBasis: TextWidthBasis.longestLine,)),
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
