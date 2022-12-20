import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

Future<List<TransactionDetails>> fetchTransaction() async {
  final response = await http.get(Uri.parse(
      'https://brotherlike-navies.000webhostapp.com/people/people.php'));

  if (response.statusCode == 200) {
    return TransactionDetails.fromJsonList(json.decode(response.body));
  } else {
    throw Exception('Request Failed.');
  }
}
