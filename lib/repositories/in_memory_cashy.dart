import 'package:master_plan/repositories/repository.dart';

class InMemoryCashy implements Repository{

  final _storage= Map<int, Model>();


  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();
    final id = (ids.length ==0) ? 1: ids.last + 1;
    // Initialize  Model object

    final model= Model(id);
    print(_storage[ids]);
    _storage[id] = model;
    return model;
  }
  @override
  Model? get(int id) {
    return _storage[id];
  }

  @override
  List<Model> getAll() {
    return _storage.values.toList(growable: false);
  }

  @override
  void update(Model item) {
  _storage[item.id] = item;
  }

  @override
  void delete(Model item) {
    // TODO: implement delete
    _storage.remove(item.id);
  }

  @override
  void clear() {
    // TODO: implement clear
    _storage.clear();
  }
}

