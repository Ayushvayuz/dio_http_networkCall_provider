import 'package:dio_network_calling/ApiCalling_with_Provider/provider_class.dart';
import 'package:dio_network_calling/Http_Calling/apiCall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ApiCalling_with_Provider/user_List.dart';
import 'DioApiCalling_with_Provider/dio_api_call.dart';
import 'DioApiCalling_with_Provider/main_screen.dart';
import 'Dio_Calling/apiCall_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create:(_)=> ProviderApi()),
          ChangeNotifierProvider(create:(_)=> ApiProvider())
    ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainPage(),
        )
    );
  }
}
