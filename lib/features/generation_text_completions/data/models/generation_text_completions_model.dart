import 'dart:convert';
import 'package:ai_image_generetor/features/generation_text_completions/domain/entities/generation_text_completions_entity.dart';

class GenerationTextCompletionsModel extends GenerationTextCompletionsEntity {
  String text;
  int? index;
  int? logprobs;
  String? finishReason;

  GenerationTextCompletionsModel({
    required this.text,
    this.index,
    this.logprobs,
    this.finishReason,
  }) : super(
            responseText: text,
            indexFromObject: index,
            logprobsTokens: logprobs,
            finish: finishReason);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'index': index,
      'logprobs': logprobs,
      'finishReason': finishReason,
    };
  }

  factory GenerationTextCompletionsModel.fromMap(Map<String, dynamic> map) {
    return GenerationTextCompletionsModel(
      text: map['text'] as String,
      index: map['index'] != null ? map['index'] as int : null,
      logprobs: map['logprobs'] != null ? map['logprobs'] as int : null,
      finishReason: map['finishReason'] != null ? map['finishReason'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationTextCompletionsModel.fromJson(String source) => GenerationTextCompletionsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
