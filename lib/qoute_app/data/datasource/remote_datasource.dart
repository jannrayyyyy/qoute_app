import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constant/api_constant.dart';
import '../model/qoute_model.dart';

abstract class RemoteDataSource {
  Future<List<QouteModel>> fetchQoute();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<List<QouteModel>> fetchQoute() async {
    List<QouteModel> qoutes = [];
    final response = await http.get(Uri.parse(apiUri));
    if (response.statusCode == 200) {
      final rawData = jsonDecode(response.body);
      rawData.forEach((map) {
        qoutes.add(QouteModel.fromJson(map));
      });
      return qoutes;
    }
    throw UnimplementedError();
  }
}
