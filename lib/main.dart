import 'package:deborduurshop/src/app.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await Hive.initFlutter();

  if (!kIsWeb) {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    await Hive.openBox('stories');
  } else {
    await Hive.openBox('stories');
    debugPrint('handle task here✔✔✔✔💕💕😂😂in main ');
  }
  await MyApp.initializeAndRun();
}
