import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider with ChangeNotifier {
  final Dio _dio = Dio();

  Future<String> fetchData() async {
    try {
      final response = await _dio.get('https://protocoderspoint.com/jsondata/superheros.json');
      final data = response.data.toString();
      return data;
    } catch (error) {
      throw error.toString();
    }
  }
}
