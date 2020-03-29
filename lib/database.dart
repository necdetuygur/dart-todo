import 'package:sqlite3/sqlite.dart';
import 'todo.dart';

Database Connect() {
  Database d = Database("database1.db");
  String sql =
      "CREATE TABLE IF NOT EXISTS todos(id INTEGER PRIMARY KEY, title TEXT)";
  d.execute(sql);
  return d;
}

void Add(Todo item) {
  final Database db = Connect();
  String sql = "INSERT INTO todos (title) VALUES ('${item.title}');";
  db.execute(sql);
  db.close();
}

List<Todo> GetAll() {
  List<Todo> ret = new List<Todo>();
  final Database db = Connect();
  String sql = "SELECT * FROM todos LIMIT 9999;";
  Result result = db.query(sql);
  for (Row r in result) {
    Todo todo = new Todo();
    int id = r.readColumnAsInt("id");
    String title = r.readColumn("title");
    todo.id = id;
    todo.title = title;
    ret.add(todo);
  }
  db.close();
  return ret;
}

Todo Get(Todo item) {
  Todo ret = new Todo();
  final Database db = Connect();
  String sql = "SELECT * FROM todos WHERE id = ${item.id};";
  Result result = db.query(sql);
  for (Row r in result) {
    ret.id = r.readColumnAsInt("id");
    ret.title = r.readColumn("title");
  }
  db.close();
  return ret;
}

void Del(Todo item) {
  final Database db = Connect();
  String sql = "DELETE FROM todos WHERE id = ${item.id};";
  db.execute(sql);
  db.close();
}

void Set(Todo item) {
  final Database db = Connect();
  String sql =
      "UPDATE todos SET title = '${item.title}' WHERE id = ${item.id};";
  db.execute(sql);
  db.close();
}
