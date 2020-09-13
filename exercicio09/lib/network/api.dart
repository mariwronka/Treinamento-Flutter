import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Api() {
    dio.options.baseUrl = 'https://dog.ceo/api/';
  }

  Future<String> getDogByBreed(String breedName) async {
    Response response;
    try {
      response = await dio.get('breed/$breedName/images/random');
    } catch (e) {
      print(e);
    }

    return response == null ? '' : response.data["message"];
  }

  Future<String> getRandomDog() async {
    Response response;
    try {
      response = await dio.get('breeds/image/random');
    } catch (e) {
      print(e);
    }

    return response == null ? '' : response.data["message"];
  }
}