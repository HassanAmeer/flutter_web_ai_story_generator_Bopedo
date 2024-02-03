part of services;

class FirestoreService {
  static final _firestore = FirebaseFirestore.instance;

  Future<void> savePromptStory({
    required StoriesFirestoreModel storyModel,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.kPromptCollection)
          .add(storyModel.toJson());
    } catch (_) {
      rethrow;
    }
  }
}
