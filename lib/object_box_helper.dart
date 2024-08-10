import 'package:objectbox_test/main.dart';
import 'package:objectbox_test/user_model.dart';

import 'objectbox.g.dart';

class ObjectBoxHelper {
  late final Store _store;
  late final Box<UserModel> _userBox;
  late final Box<Device> _mobileInfoBox;

  ObjectBoxHelper._init(this._store) {
    _userBox = Box<UserModel>(_store);
    _mobileInfoBox = Box<Device>(_store);
  }
  static Future<ObjectBoxHelper> init() async {
    final store = await openStore();
    return ObjectBoxHelper._init(store);
  }

  UserModel? getUser(int id) => _userBox.get(id);
  int insertUser(UserModel user) => _userBox.put(user);
  bool delete(int userId) => _userBox.remove(userId);
  UserModel? getUserByName(String name) =>
      _userBox.query(UserModel_.name.contains(name)).build().findFirst();
  Future<int> setDeviceId() async {
    String deviceId = await getId() ?? '';
    Device deviceInfo = Device(deviceId: deviceId);
    return _mobileInfoBox.put(deviceInfo);
  }

  Device? getDeviceId() => _mobileInfoBox.get(1);
}
