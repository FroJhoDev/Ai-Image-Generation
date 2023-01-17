import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'dart:io';

import 'package:ai_image_generetor/constants.dart';
import 'package:ai_image_generetor/models/text_completions_model.dart';

class TextCompletionsRepository {
  Client client = Client();

  Future<List<Choices>> createsCompletion(String prompText) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.completionsEndpoint);

      final response = await client.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {
            "model": "text-davinci-003",
            "prompt": prompText,
            "n": 1,
            "max_tokens": 1000,
            "temperature": 1,
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> textCompletion = json.decode(utf8.decode(response.bodyBytes));
        List<Choices> choicesList = (textCompletion['choices'] as List)
            .map((item) => Choices.fromJson(item))
            .toList();

        return choicesList;
        
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

   Future<String?>responseMenssageFromAI(String prompText) async {
    try {
      var url =
          Uri.parse(ApiConstants.baseUrl + ApiConstants.completionsEndpoint);

      final response = await client.post(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {
            "model": "text-davinci-003",
            "prompt": prompText,
            "n": 1,
            "max_tokens": 1000,
            "temperature": 1,
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> textCompletion = json.decode(utf8.decode(response.bodyBytes));
        List<Choices> choicesList = (textCompletion['choices'] as List)
            .map((item) => Choices.fromJson(item))
            .toList();

        return choicesList.first.text;
        
      } else {
        return 'Desculpe não cosegui entender :(';
      }
    } catch (e) {
      return 'Um erro ocorreu, feche a aplicação e tente novamente!';
    }
  }
}
