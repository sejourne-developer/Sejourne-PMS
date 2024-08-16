import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  // Generic Method To Save Data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
    _storage.save();
  }

  // Generic Method To Read Data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic Method To Remove Data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
    _storage.save();
  }

  // Generic Method To Remove Data
  Future<void> clearAll() async {
    await _storage.erase();
    _storage.save();
  }
}
