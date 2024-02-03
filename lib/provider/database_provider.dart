import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class DatabaseProvider extends ChangeNotifier {
  List _storiesList = [];

  void addStoryToList(story) {
    _storiesList.add(story);
    insertStory(_storiesList);
    notifyListeners();
  }

  void deleteStory(story) {
    var box = Hive.box('stories');
    List existingStories = box.get('getStories', defaultValue: []);

    int index = existingStories.indexWhere((existingStory) {
      return existingStory['genre'] == story['genre'] &&
          existingStory['text'] == story['text'] &&
          existingStory['image'] == story['image'];
    });

    if (index != -1) {
      existingStories.removeAt(index);
      box.put('getStories', existingStories);
      debugPrint('Story deleted from Hive👋');
    } else {
      debugPrint('Story not found in Hive. Unable to delete.');
    }
    box.put('getStories', existingStories);
  }

  void insertStory(storyList) {
    var box = Hive.box('stories');
    List existingStories = box.get('getStories', defaultValue: []);
    existingStories.addAll(storyList);
    box.put('getStories', existingStories);
    debugPrint('Data stored in Hive👏👏👏');
  }

  List getAllStories() {
    var box = Hive.box('stories');
    final storiesList = box.get('getStories');
    notifyListeners();
    if (storiesList != null) {
      debugPrint('All stories in hive are👏👏👏${storiesList.length}');
    }
    if (storiesList == null) {
      return [];
    }
    return storiesList;
  }
}
