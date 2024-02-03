import 'package:flutter/material.dart';

class StoryProvider with ChangeNotifier {
  final List _listOfStories = [];
  List get listOfStories => _listOfStories;

  final List _listOfGenre = [
    'Science Fiction',
    'Romantic',
    'Mystery',
    "Suspenseful",
    "Adventure",
    "Fairy Tales",
    "Fantasy",
    "Horror",
    "Romance",
  ];
  List get listOfGenre => _listOfGenre;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _selectedMenuIndex = 0;
  int get selectedMenuIndex => _selectedMenuIndex;

  String _selectedGenre = 'Science Fiction';
  String get selectedGenre => _selectedGenre;

  changeIndex(int index) {
    _selectedMenuIndex = index;
    notifyListeners();
  }

  void addStory(String imageUrl, text, genre) {
    _listOfStories.add({'genre': genre, 'text': text, 'imageUrl': imageUrl});
    notifyListeners();
  }

  toggleLoading(loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>>
      showErrorSnackBar(BuildContext context, String title) async {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(title)));
  }

  void setCurrentGenre(String genre) {
    _selectedGenre = genre;
    notifyListeners();
  }
}
