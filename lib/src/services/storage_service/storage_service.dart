part of services;

class StorageService {
  Future<String> uploadFile(Uint8List file) async {
    try {
      final response = await FirebaseStorage.instance
          .ref('stories/${DateTime.now().toIso8601String()}.pdf')
          .putData(file);
      return await response.ref.getDownloadURL();
    } on FirebaseException catch (_) {
      rethrow;
    }
  }
}
