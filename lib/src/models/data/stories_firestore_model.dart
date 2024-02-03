part of models;

@freezed
abstract class StoriesFirestoreModel implements _$StoriesFirestoreModel {
  const StoriesFirestoreModel._();

  @JsonSerializable(includeIfNull: false)
  const factory StoriesFirestoreModel({
    String? id,
    required String prompt,
    required String story,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'pdf_link') required String pdfLink,
    required String genre,
    required String language,
  }) = _StoriesFirestoreModel;

  factory StoriesFirestoreModel.fromJson(Json json) =>
      _$StoriesFirestoreModelFromJson(json);

  Json toMap() => toJson();
}
