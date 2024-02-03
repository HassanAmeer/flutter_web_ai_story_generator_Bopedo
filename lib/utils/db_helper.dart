// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// // Define the table name and column names
//
// class DatabaseHelper {
//   static String tableName = 'stories';
//   static String columnId = 'id';
//   static String columnStory = 'story';
//   static String columnImagePath = 'imagePath';
//   static String columnGenre = 'genre';
//
//   static final DatabaseHelper instance = DatabaseHelper._();
//   static Database? _database;
//
//   DatabaseHelper._();
//
//   Future<Database> get database async {
//     if (_database != null) {
//       return _database!;
//     }
//
//     _database = await _initDatabase();
//     return _database!;
//   }
//
//   Future<Database> _initDatabase() async {
//     final String databasesPath = await getDatabasesPath();
//     final String path = join(databasesPath, 'stories.db');
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute('''
//           CREATE TABLE $tableName (
//             $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//             $columnStory TEXT,
//             $columnImagePath TEXT,
//             $columnGenre TEXT
//           )
//         ''');
//       },
//     );
//   }
//
//   Future<int> insertStory(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     return await db.insert(tableName, row);
//   }
//
//   Future<List<Map<String, dynamic>>> getAllStories() async {
//     Database db = await instance.database;
//     return await db.query(tableName);
//   }
// }
