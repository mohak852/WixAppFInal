import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = "FoodItems";
final String columnId = "id";
final String columnName = "name";
final String columnImage = "image";
final String columnPrice = "price";
final String columnQuantity = "quantity";
final String columnFoodid = "food_id";
final _databaseName = "RecordsDatabase.db";
final _databaseVersion = 1;

class CartItem {
  int id;
  String food_id;
  String name;
  String quantity;
  double price;
  String imagePath;
  CartItem({this.imagePath, this.name, this.price, this.food_id,this.quantity});
  Map<String, dynamic> toMap() {
    return {
      columnFoodid: this.food_id,
      columnName: this.name,
      columnPrice: this.price,
      columnImage: this.imagePath,
      columnQuantity:this.quantity,
    };
  }
}

class CartHelper {
//++++++++++++
  CartHelper._privateConstructor();
  static final CartHelper instance = CartHelper._privateConstructor();
  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

// this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT,
           $columnName TEXT,
           $columnFoodid TEXT,
           $columnQuantity TEXT,
           $columnPrice DOUBLE,
           $columnImage TEXT)
          ''');
  }

  Future<void> addToCart(CartItem item) async {
    Database db = await instance.database;
    var res = db.insert(tableName, item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> totalCartItems() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<double> getTotalPrice() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('SELECT SUM($columnPrice) FROM $tableName');
    return items[0]["SUM(price)"];
  }

  void emptyCart() async {
    Database db = await instance.database;
    return await db.execute("DELETE FROM $tableName");
  }

  Future<List<CartItem>> getCart() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery("SELECT * FROM $tableName");
    return List.generate(items.length, (index) {
      return CartItem(
        quantity: items[index][columnQuantity],
        food_id: items[index][columnFoodid],
        imagePath: items[index][columnImage],
        name: items[index][columnName],
        price: items[index][columnPrice],
      );
    });
  }
}
