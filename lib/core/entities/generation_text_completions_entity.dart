class GenerationTextCompletionsEntity {
  String responseText;
  int? indexFromObject;
  int? logprobsTokens;
  String? finish;

  GenerationTextCompletionsEntity(
      {required this.responseText,
      this.indexFromObject,
      this.logprobsTokens,
      this.finish});
}
