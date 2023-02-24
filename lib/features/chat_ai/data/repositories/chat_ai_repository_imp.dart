import 'dart:convert';
import 'dart:developer';

import '../../../../core/services/http_client_service.dart';
import '../../../../core/config/api_constants.dart';

import '../models/text_received_from_ai_model.dart';
import '../../domain/entities/chat_ai_message_entity.dart';
import '../../domain/repositories/chat_ai_repository.dart';
import '../../../../core/entities/generation_text_completions_entity.dart';

class ChatAiRepositoryImp extends ChatAiRepository {
  final HttpClientService _httpClientService;

  ChatAiRepositoryImp(
    this._httpClientService,
  );

  @override
  Future<ChatAiMessageEntity> sendMessageToAI({
    required String messageFromUser,
  }) async {
    try {
      var httpResult = await _httpClientService.request(
        url: ApiConstants.textCompletionsEndpoint,
        method: 'post',
        body: {
          "model": "text-davinci-003",
          "prompt": messageFromUser,
          "n": 1,
          "max_tokens": 1000,
          "temperature": 1,
        },
      );

      late ChatAiMessageEntity aiMessage;

      List<GenerationTextCompletionsEntity> textReceivedFromAiList =
          (httpResult['choices'] as List)
              .map(
                  (item) => TextReceivedFromAiModel.fromJson(json.encode(item)))
              .toList();

      aiMessage = ChatAiMessageEntity(
        message: textReceivedFromAiList.first.responseText.trim(),
        isReceived: true,
        time: '${DateTime.now().hour} : ${DateTime.now().minute}',
        avatar: 'assets/images/chatgpt_logo.jpg',
      );

      return aiMessage;
    } on Exception catch (error, stack) {
      log('Erro ao recuperar texto gerado na API',
          error: error, stackTrace: stack);
      throw ('Erro ao recuperar texto gerado na API');
    }
  }
}
