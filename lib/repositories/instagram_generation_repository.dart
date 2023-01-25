import 'dart:convert';
import 'dart:io';

import 'package:ai_image_generetor/core/api_constants.dart';
import 'package:ai_image_generetor/models/image_generations_model.dart';
import 'package:ai_image_generetor/models/instagram_generation_model.dart';
import 'package:ai_image_generetor/models/text_completions_model.dart';
import 'package:http/http.dart';

class InstagramRepository {

  Client client = Client();

  Future<List<InstagramGeneration>> generateInstagramPost(String imageText, String descriptionText, String hashtagsText) async {
    
    try {

      late List<InstagramGeneration> instagramGenerationList = [];
      final InstagramGeneration instagramGeneration =  InstagramGeneration();

      late List<ImageGenerationsModel> imageGerationsList = [];
      late List<Choices> descriptionList;
      late List<Choices> hashtagsList;

      final responseImg = await client.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.imagesGenerationsEndpoint),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {"prompt": '$imageText ,sem textos', "n": 1, "size": "512x512"},
        ),
      );

      if (responseImg.statusCode == 200) {
        final Map<String, dynamic> imageData = json.decode(responseImg.body);
        imageGerationsList = (imageData['data']
                as List)
            .map((item) => ImageGenerationsModel.fromJson(json.encode(item)))
            .toList();
      }

      final responseDescription = await client.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.textCompletionsEndpoint),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {
            "model": "text-davinci-003",
            "prompt": 'texto chamativo sobre $descriptionText',
            "n": 1,
            "max_tokens": 1000,
            "temperature": 1,
          },
        ),
      );

      if (responseDescription.statusCode == 200) {
        final Map<String, dynamic> textCompletion = json.decode(utf8.decode(responseDescription.bodyBytes));
        descriptionList = (textCompletion['choices'] as List)
            .map((item) => Choices.fromJson(item))
            .toList();
      }

      final responseHashtags = await client.post(
        Uri.parse(ApiConstants.baseUrl + ApiConstants.textCompletionsEndpoint),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer ${ApiConstants.secretKey}'
        },
        body: jsonEncode(
          {
            "model": "text-davinci-003",
            "prompt": 'hashtags para postagem sobre $hashtagsText',
            "n": 1,
            "max_tokens": 1000,
            "temperature": 1,
          },
        ),
      );

      if (responseHashtags.statusCode == 200) {
        final Map<String, dynamic> textCompletionHashtags = json.decode(utf8.decode(responseHashtags.bodyBytes));
        hashtagsList = (textCompletionHashtags['choices'] as List)
            .map((item) => Choices.fromJson(item))
            .toList();
      }

      instagramGeneration.imageUrl = imageGerationsList.first.url;
      instagramGeneration.description = descriptionList.first.text;
      instagramGeneration.hashtags = hashtagsList.first.text;

      instagramGenerationList = [instagramGeneration];
      
      return instagramGenerationList;
      
    } catch (e) {
      print(e);
      return [];
    }

  }

}