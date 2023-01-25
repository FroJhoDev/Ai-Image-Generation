import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client;

import 'package:ai_image_generetor/core/api_constants.dart';
import 'package:ai_image_generetor/models/image_generations_model.dart';

class ImageGenerationsRepository {
  Client client = Client();

  Future<List<ImageGenerationsModel>> generateImageFromText(
      String prompText, String imgSize, String imgNumber) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.imagesGenerationsEndpoint);

      final response = await client.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {"prompt": prompText, "n": int.parse(imgNumber), "size": imgSize},
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> imageData = json.decode(response.body);
        List<ImageGenerationsModel> imageGerationsList = (imageData['data']
                as List)
            .map((item) => ImageGenerationsModel.fromJson(json.encode(item)))
            .toList();

        return imageGerationsList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
