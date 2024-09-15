import 'package:movie_app/core/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences db;
  const LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async {
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> remove(StorageKey key) async {
    return db.remove(key.name);
  }

  @override
  Future<bool> store(StorageKey key, String data) async {
    return db.setString(key.name, data);
  }
}

/*
class HTMLLocalDataSource implements LocalDataSource {
  @override
  String? read(StorageKey key) {
    print("THIS IS TOKEN: ${window.localStorage[key.name]}");
    if(window.localStorage.containsKey(key.name)) {
      return window.localStorage[key.name];
    } else {
      return null;
    }
  }

  @override
  Future<bool> remove(StorageKey key) async {
    final result = window.localStorage.remove(key.name);
    return result != null;
  }

  @override
  Future<bool> store(StorageKey key, String data) async {
    window.localStorage.addAll({key.name: data});
    return true;
  }
}*/

