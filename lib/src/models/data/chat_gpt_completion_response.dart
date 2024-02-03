part of models;

@freezed
abstract class ChatGptCompletionResponse
    implements _$ChatGptCompletionResponse {
  ChatGptCompletionResponse._();

  @JsonSerializable(includeIfNull: false)
  factory ChatGptCompletionResponse({
    required String id,
    required String object,
    required int created,
    required String model,
    required List<ChatGptChoicesResponse> choices,
    required ChatGptUsageResponse usage,
  }) = _ChatGptCompletionResponse;

  factory ChatGptCompletionResponse.fromJson(Json json) =>
      _$ChatGptCompletionResponseFromJson(json);
}

@freezed
abstract class ChatGptChoicesResponse implements _$ChatGptChoicesResponse {
  const ChatGptChoicesResponse._();

  @JsonSerializable(includeIfNull: false)
  factory ChatGptChoicesResponse({
    required String text,
    required int index,
    @JsonKey(name: 'logprobs') int? logProbs,
    @JsonKey(name: 'finish_reason') required String finishReason,
  }) = _ChatGptChoicesResponse;

  factory ChatGptChoicesResponse.fromJson(Json json) =>
      _$ChatGptChoicesResponseFromJson(json);
}

@freezed
abstract class ChatGptUsageResponse implements _$ChatGptUsageResponse {
  const ChatGptUsageResponse._();

  @JsonSerializable(includeIfNull: false)
  factory ChatGptUsageResponse({
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'total_tokens') required int totalTokens,
  }) = _ChatGptUsageResponse;

  factory ChatGptUsageResponse.fromJson(Json json) =>
      _$ChatGptUsageResponseFromJson(json);
}
