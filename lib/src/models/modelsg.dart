// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatGptCompletionResponse _$$_ChatGptCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChatGptCompletionResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      created: json['created'] as int,
      model: json['model'] as String,
      choices: (json['choices'] as List<dynamic>)
          .map(
              (e) => ChatGptChoicesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      usage:
          ChatGptUsageResponse.fromJson(json['usage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatGptCompletionResponseToJson(
        _$_ChatGptCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
      'usage': instance.usage,
    };

_$_ChatGptChoicesResponse _$$_ChatGptChoicesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChatGptChoicesResponse(
      text: json['text'] as String,
      index: json['index'] as int,
      logProbs: json['logprobs'] as int?,
      finishReason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$$_ChatGptChoicesResponseToJson(
    _$_ChatGptChoicesResponse instance) {
  final val = <String, dynamic>{
    'text': instance.text,
    'index': instance.index,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('logprobs', instance.logProbs);
  val['finish_reason'] = instance.finishReason;
  return val;
}

_$_ChatGptUsageResponse _$$_ChatGptUsageResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ChatGptUsageResponse(
      promptTokens: json['prompt_tokens'] as int,
      completionTokens: json['completion_tokens'] as int,
      totalTokens: json['total_tokens'] as int,
    );

Map<String, dynamic> _$$_ChatGptUsageResponseToJson(
        _$_ChatGptUsageResponse instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };

_$_StoriesFirestoreModel _$$_StoriesFirestoreModelFromJson(
        Map<String, dynamic> json) =>
    _$_StoriesFirestoreModel(
      id: json['id'] as String?,
      prompt: json['prompt'] as String,
      story: json['story'] as String,
      userId: json['user_id'] as String,
      pdfLink: json['pdf_link'] as String,
      genre: json['genre'] as String,
      language: json['language'] as String,
    );

Map<String, dynamic> _$$_StoriesFirestoreModelToJson(
    _$_StoriesFirestoreModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['prompt'] = instance.prompt;
  val['story'] = instance.story;
  val['user_id'] = instance.userId;
  val['pdf_link'] = instance.pdfLink;
  val['genre'] = instance.genre;
  val['language'] = instance.language;
  return val;
}
