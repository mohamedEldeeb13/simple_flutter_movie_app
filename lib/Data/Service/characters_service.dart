import 'dart:developer';
import 'package:dio/dio.dart';
import '../../constant/strings.dart';

class CharactersService {
  late Dio dio;

  CharactersService() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20));

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      return response.data["results"];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
