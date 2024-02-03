// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatGptCompletionResponse _$ChatGptCompletionResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatGptCompletionResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatGptCompletionResponse {
  String get id => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  List<ChatGptChoicesResponse> get choices =>
      throw _privateConstructorUsedError;
  ChatGptUsageResponse get usage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptCompletionResponseCopyWith<ChatGptCompletionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptCompletionResponseCopyWith<$Res> {
  factory $ChatGptCompletionResponseCopyWith(ChatGptCompletionResponse value,
          $Res Function(ChatGptCompletionResponse) then) =
      _$ChatGptCompletionResponseCopyWithImpl<$Res, ChatGptCompletionResponse>;
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<ChatGptChoicesResponse> choices,
      ChatGptUsageResponse usage});

  $ChatGptUsageResponseCopyWith<$Res> get usage;
}

/// @nodoc
class _$ChatGptCompletionResponseCopyWithImpl<$Res,
        $Val extends ChatGptCompletionResponse>
    implements $ChatGptCompletionResponseCopyWith<$Res> {
  _$ChatGptCompletionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatGptChoicesResponse>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ChatGptUsageResponse,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatGptUsageResponseCopyWith<$Res> get usage {
    return $ChatGptUsageResponseCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatGptCompletionResponseCopyWith<$Res>
    implements $ChatGptCompletionResponseCopyWith<$Res> {
  factory _$$_ChatGptCompletionResponseCopyWith(
          _$_ChatGptCompletionResponse value,
          $Res Function(_$_ChatGptCompletionResponse) then) =
      __$$_ChatGptCompletionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String object,
      int created,
      String model,
      List<ChatGptChoicesResponse> choices,
      ChatGptUsageResponse usage});

  @override
  $ChatGptUsageResponseCopyWith<$Res> get usage;
}

/// @nodoc
class __$$_ChatGptCompletionResponseCopyWithImpl<$Res>
    extends _$ChatGptCompletionResponseCopyWithImpl<$Res,
        _$_ChatGptCompletionResponse>
    implements _$$_ChatGptCompletionResponseCopyWith<$Res> {
  __$$_ChatGptCompletionResponseCopyWithImpl(
      _$_ChatGptCompletionResponse _value,
      $Res Function(_$_ChatGptCompletionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = null,
    Object? created = null,
    Object? model = null,
    Object? choices = null,
    Object? usage = null,
  }) {
    return _then(_$_ChatGptCompletionResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChatGptChoicesResponse>,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as ChatGptUsageResponse,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ChatGptCompletionResponse extends _ChatGptCompletionResponse {
  _$_ChatGptCompletionResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required final List<ChatGptChoicesResponse> choices,
      required this.usage})
      : _choices = choices,
        super._();

  factory _$_ChatGptCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGptCompletionResponseFromJson(json);

  @override
  final String id;
  @override
  final String object;
  @override
  final int created;
  @override
  final String model;
  final List<ChatGptChoicesResponse> _choices;
  @override
  List<ChatGptChoicesResponse> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  final ChatGptUsageResponse usage;

  @override
  String toString() {
    return 'ChatGptCompletionResponse(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGptCompletionResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._choices, _choices) &&
            (identical(other.usage, usage) || other.usage == usage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, model,
      const DeepCollectionEquality().hash(_choices), usage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGptCompletionResponseCopyWith<_$_ChatGptCompletionResponse>
      get copyWith => __$$_ChatGptCompletionResponseCopyWithImpl<
          _$_ChatGptCompletionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGptCompletionResponseToJson(
      this,
    );
  }
}

abstract class _ChatGptCompletionResponse extends ChatGptCompletionResponse {
  factory _ChatGptCompletionResponse(
          {required final String id,
          required final String object,
          required final int created,
          required final String model,
          required final List<ChatGptChoicesResponse> choices,
          required final ChatGptUsageResponse usage}) =
      _$_ChatGptCompletionResponse;
  _ChatGptCompletionResponse._() : super._();

  factory _ChatGptCompletionResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatGptCompletionResponse.fromJson;

  @override
  String get id;
  @override
  String get object;
  @override
  int get created;
  @override
  String get model;
  @override
  List<ChatGptChoicesResponse> get choices;
  @override
  ChatGptUsageResponse get usage;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGptCompletionResponseCopyWith<_$_ChatGptCompletionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

ChatGptChoicesResponse _$ChatGptChoicesResponseFromJson(
    Map<String, dynamic> json) {
  return _ChatGptChoicesResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatGptChoicesResponse {
  String get text => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'logprobs')
  int? get logProbs => throw _privateConstructorUsedError;
  @JsonKey(name: 'finish_reason')
  String get finishReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptChoicesResponseCopyWith<ChatGptChoicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptChoicesResponseCopyWith<$Res> {
  factory $ChatGptChoicesResponseCopyWith(ChatGptChoicesResponse value,
          $Res Function(ChatGptChoicesResponse) then) =
      _$ChatGptChoicesResponseCopyWithImpl<$Res, ChatGptChoicesResponse>;
  @useResult
  $Res call(
      {String text,
      int index,
      @JsonKey(name: 'logprobs') int? logProbs,
      @JsonKey(name: 'finish_reason') String finishReason});
}

/// @nodoc
class _$ChatGptChoicesResponseCopyWithImpl<$Res,
        $Val extends ChatGptChoicesResponse>
    implements $ChatGptChoicesResponseCopyWith<$Res> {
  _$ChatGptChoicesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? index = null,
    Object? logProbs = freezed,
    Object? finishReason = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      logProbs: freezed == logProbs
          ? _value.logProbs
          : logProbs // ignore: cast_nullable_to_non_nullable
              as int?,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatGptChoicesResponseCopyWith<$Res>
    implements $ChatGptChoicesResponseCopyWith<$Res> {
  factory _$$_ChatGptChoicesResponseCopyWith(_$_ChatGptChoicesResponse value,
          $Res Function(_$_ChatGptChoicesResponse) then) =
      __$$_ChatGptChoicesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      int index,
      @JsonKey(name: 'logprobs') int? logProbs,
      @JsonKey(name: 'finish_reason') String finishReason});
}

/// @nodoc
class __$$_ChatGptChoicesResponseCopyWithImpl<$Res>
    extends _$ChatGptChoicesResponseCopyWithImpl<$Res,
        _$_ChatGptChoicesResponse>
    implements _$$_ChatGptChoicesResponseCopyWith<$Res> {
  __$$_ChatGptChoicesResponseCopyWithImpl(_$_ChatGptChoicesResponse _value,
      $Res Function(_$_ChatGptChoicesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? index = null,
    Object? logProbs = freezed,
    Object? finishReason = null,
  }) {
    return _then(_$_ChatGptChoicesResponse(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      logProbs: freezed == logProbs
          ? _value.logProbs
          : logProbs // ignore: cast_nullable_to_non_nullable
              as int?,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ChatGptChoicesResponse extends _ChatGptChoicesResponse {
  _$_ChatGptChoicesResponse(
      {required this.text,
      required this.index,
      @JsonKey(name: 'logprobs') this.logProbs,
      @JsonKey(name: 'finish_reason') required this.finishReason})
      : super._();

  factory _$_ChatGptChoicesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGptChoicesResponseFromJson(json);

  @override
  final String text;
  @override
  final int index;
  @override
  @JsonKey(name: 'logprobs')
  final int? logProbs;
  @override
  @JsonKey(name: 'finish_reason')
  final String finishReason;

  @override
  String toString() {
    return 'ChatGptChoicesResponse(text: $text, index: $index, logProbs: $logProbs, finishReason: $finishReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGptChoicesResponse &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.logProbs, logProbs) ||
                other.logProbs == logProbs) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, text, index, logProbs, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGptChoicesResponseCopyWith<_$_ChatGptChoicesResponse> get copyWith =>
      __$$_ChatGptChoicesResponseCopyWithImpl<_$_ChatGptChoicesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGptChoicesResponseToJson(
      this,
    );
  }
}

abstract class _ChatGptChoicesResponse extends ChatGptChoicesResponse {
  factory _ChatGptChoicesResponse(
          {required final String text,
          required final int index,
          @JsonKey(name: 'logprobs') final int? logProbs,
          @JsonKey(name: 'finish_reason') required final String finishReason}) =
      _$_ChatGptChoicesResponse;
  _ChatGptChoicesResponse._() : super._();

  factory _ChatGptChoicesResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatGptChoicesResponse.fromJson;

  @override
  String get text;
  @override
  int get index;
  @override
  @JsonKey(name: 'logprobs')
  int? get logProbs;
  @override
  @JsonKey(name: 'finish_reason')
  String get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGptChoicesResponseCopyWith<_$_ChatGptChoicesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatGptUsageResponse _$ChatGptUsageResponseFromJson(Map<String, dynamic> json) {
  return _ChatGptUsageResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatGptUsageResponse {
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_tokens')
  int get completionTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatGptUsageResponseCopyWith<ChatGptUsageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatGptUsageResponseCopyWith<$Res> {
  factory $ChatGptUsageResponseCopyWith(ChatGptUsageResponse value,
          $Res Function(ChatGptUsageResponse) then) =
      _$ChatGptUsageResponseCopyWithImpl<$Res, ChatGptUsageResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class _$ChatGptUsageResponseCopyWithImpl<$Res,
        $Val extends ChatGptUsageResponse>
    implements $ChatGptUsageResponseCopyWith<$Res> {
  _$ChatGptUsageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatGptUsageResponseCopyWith<$Res>
    implements $ChatGptUsageResponseCopyWith<$Res> {
  factory _$$_ChatGptUsageResponseCopyWith(_$_ChatGptUsageResponse value,
          $Res Function(_$_ChatGptUsageResponse) then) =
      __$$_ChatGptUsageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'total_tokens') int totalTokens});
}

/// @nodoc
class __$$_ChatGptUsageResponseCopyWithImpl<$Res>
    extends _$ChatGptUsageResponseCopyWithImpl<$Res, _$_ChatGptUsageResponse>
    implements _$$_ChatGptUsageResponseCopyWith<$Res> {
  __$$_ChatGptUsageResponseCopyWithImpl(_$_ChatGptUsageResponse _value,
      $Res Function(_$_ChatGptUsageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$_ChatGptUsageResponse(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ChatGptUsageResponse extends _ChatGptUsageResponse {
  _$_ChatGptUsageResponse(
      {@JsonKey(name: 'prompt_tokens') required this.promptTokens,
      @JsonKey(name: 'completion_tokens') required this.completionTokens,
      @JsonKey(name: 'total_tokens') required this.totalTokens})
      : super._();

  factory _$_ChatGptUsageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ChatGptUsageResponseFromJson(json);

  @override
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;

  @override
  String toString() {
    return 'ChatGptUsageResponse(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatGptUsageResponse &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatGptUsageResponseCopyWith<_$_ChatGptUsageResponse> get copyWith =>
      __$$_ChatGptUsageResponseCopyWithImpl<_$_ChatGptUsageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatGptUsageResponseToJson(
      this,
    );
  }
}

abstract class _ChatGptUsageResponse extends ChatGptUsageResponse {
  factory _ChatGptUsageResponse(
      {@JsonKey(name: 'prompt_tokens') required final int promptTokens,
      @JsonKey(name: 'completion_tokens') required final int completionTokens,
      @JsonKey(name: 'total_tokens')
      required final int totalTokens}) = _$_ChatGptUsageResponse;
  _ChatGptUsageResponse._() : super._();

  factory _ChatGptUsageResponse.fromJson(Map<String, dynamic> json) =
      _$_ChatGptUsageResponse.fromJson;

  @override
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  int get completionTokens;
  @override
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$_ChatGptUsageResponseCopyWith<_$_ChatGptUsageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StoriesFirestoreModel _$StoriesFirestoreModelFromJson(
    Map<String, dynamic> json) {
  return _StoriesFirestoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoriesFirestoreModel {
  String? get id => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  String get story => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'pdf_link')
  String get pdfLink => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoriesFirestoreModelCopyWith<StoriesFirestoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesFirestoreModelCopyWith<$Res> {
  factory $StoriesFirestoreModelCopyWith(StoriesFirestoreModel value,
          $Res Function(StoriesFirestoreModel) then) =
      _$StoriesFirestoreModelCopyWithImpl<$Res, StoriesFirestoreModel>;
  @useResult
  $Res call(
      {String? id,
      String prompt,
      String story,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'pdf_link') String pdfLink,
      String genre,
      String language});
}

/// @nodoc
class _$StoriesFirestoreModelCopyWithImpl<$Res,
        $Val extends StoriesFirestoreModel>
    implements $StoriesFirestoreModelCopyWith<$Res> {
  _$StoriesFirestoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = null,
    Object? story = null,
    Object? userId = null,
    Object? pdfLink = null,
    Object? genre = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfLink: null == pdfLink
          ? _value.pdfLink
          : pdfLink // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoriesFirestoreModelCopyWith<$Res>
    implements $StoriesFirestoreModelCopyWith<$Res> {
  factory _$$_StoriesFirestoreModelCopyWith(_$_StoriesFirestoreModel value,
          $Res Function(_$_StoriesFirestoreModel) then) =
      __$$_StoriesFirestoreModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String prompt,
      String story,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'pdf_link') String pdfLink,
      String genre,
      String language});
}

/// @nodoc
class __$$_StoriesFirestoreModelCopyWithImpl<$Res>
    extends _$StoriesFirestoreModelCopyWithImpl<$Res, _$_StoriesFirestoreModel>
    implements _$$_StoriesFirestoreModelCopyWith<$Res> {
  __$$_StoriesFirestoreModelCopyWithImpl(_$_StoriesFirestoreModel _value,
      $Res Function(_$_StoriesFirestoreModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = null,
    Object? story = null,
    Object? userId = null,
    Object? pdfLink = null,
    Object? genre = null,
    Object? language = null,
  }) {
    return _then(_$_StoriesFirestoreModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      story: null == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfLink: null == pdfLink
          ? _value.pdfLink
          : pdfLink // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_StoriesFirestoreModel extends _StoriesFirestoreModel {
  const _$_StoriesFirestoreModel(
      {this.id,
      required this.prompt,
      required this.story,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'pdf_link') required this.pdfLink,
      required this.genre,
      required this.language})
      : super._();

  factory _$_StoriesFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoriesFirestoreModelFromJson(json);

  @override
  final String? id;
  @override
  final String prompt;
  @override
  final String story;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'pdf_link')
  final String pdfLink;
  @override
  final String genre;
  @override
  final String language;

  @override
  String toString() {
    return 'StoriesFirestoreModel(id: $id, prompt: $prompt, story: $story, userId: $userId, pdfLink: $pdfLink, genre: $genre, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoriesFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.story, story) || other.story == story) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pdfLink, pdfLink) || other.pdfLink == pdfLink) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, prompt, story, userId, pdfLink, genre, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoriesFirestoreModelCopyWith<_$_StoriesFirestoreModel> get copyWith =>
      __$$_StoriesFirestoreModelCopyWithImpl<_$_StoriesFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoriesFirestoreModelToJson(
      this,
    );
  }
}

abstract class _StoriesFirestoreModel extends StoriesFirestoreModel {
  const factory _StoriesFirestoreModel(
      {final String? id,
      required final String prompt,
      required final String story,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'pdf_link') required final String pdfLink,
      required final String genre,
      required final String language}) = _$_StoriesFirestoreModel;
  const _StoriesFirestoreModel._() : super._();

  factory _StoriesFirestoreModel.fromJson(Map<String, dynamic> json) =
      _$_StoriesFirestoreModel.fromJson;

  @override
  String? get id;
  @override
  String get prompt;
  @override
  String get story;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'pdf_link')
  String get pdfLink;
  @override
  String get genre;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$_StoriesFirestoreModelCopyWith<_$_StoriesFirestoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}
