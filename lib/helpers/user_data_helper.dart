import 'dart:convert';
import 'dart:developer';

import 'package:demo_http/config.dart';
import 'package:demo_http/models/user_data.dart';
import 'package:http/http.dart' as http;

class UserDataHelper {
  Future<List<UserData>> getAllUserData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Accept': 'application/json',
      });

      final List<UserData> loadedData = [];

      if (response.statusCode == 200) {
        log('get api called');

        final extractedData = json.decode(response.body);

        for (var userData in (extractedData as List)) {
          loadedData.add(UserData.fromJson(userData));
        }
      }
      return loadedData;
    } catch (error) {
      rethrow;
    }
  }
}
