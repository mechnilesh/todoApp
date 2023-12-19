import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/utils/utils.dart';
import '../models/task.dart';

class TaskDatasource {
  // Singleton instance
  static final TaskDatasource _instance = TaskDatasource._();

  // Singleton accessor
  factory TaskDatasource() => _instance;

  // Private constructor
  TaskDatasource._() {
    _initDB();
  }

  static Database? _database;

  // Get database instance
  Future<Database?> get database async {
    _database ??= await _initDB();
    return _database;
  }

  // Initialize database
  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DBKeys.dbName);
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create database table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE ${DBKeys.dbTable}(
           ${DBKeys.idColumn} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBKeys.titleColumn} TEXT,
            ${DBKeys.noteColumn} TEXT,
            ${DBKeys.dateColumn} TEXT,
            ${DBKeys.timeColumn} TEXT,
            ${DBKeys.categoryColumn} TEXT,
            ${DBKeys.isCompletedColumn} INTEGER
        )
    ''');
  }

  // add task to database
  Future<int> addTask(Task task) async {
    final db = await database;
    return db!.transaction((txn) async {
      return await txn.insert(
        DBKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  // update task in database
  Future<int> updateTask(Task task) async {
    final db = await database;
    return db!.transaction((txn) async {
      return await txn.update(
        DBKeys.dbTable,
        task.toJson(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  // delete tasks from database
  Future<int> deleteTask(Task task) async {
    final db = await database;
    return db!.transaction((txn) async {
      return await txn.delete(
        DBKeys.dbTable,
        where: 'id = ?',
        whereArgs: [task.id],
      );
    });
  }

  // get all tasks from database
  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data =
        await db!.query(DBKeys.dbTable, orderBy: 'id DESC');

    return List.generate(
      data.length,
      (index) => Task.fromJson(
        data[index],
      ),
    );
  }
}
