import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  static const String url = 'https://dl.dropboxusercontent.com/s/p57gxwqm84zkp96/demo_api.json';

  Future<List<Store>> fetchStores() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> storeData = jsonResponse['Result'];
        return storeData.map((store) => Store.fromJson(store)).toList();
      } else {
        debugPrint('Failed to load stores. Status code: ${response.statusCode}');
        throw Exception('Failed to load stores');
      }
    } catch (e) {
      debugPrint('Error fetching stores: $e');
      throw Exception('Failed to load stores');
    }
  }
}