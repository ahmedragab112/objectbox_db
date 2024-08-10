import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class UserModel {
  int id;
  final String name;
  final String email;

  UserModel({this.id = 0, required this.name, required this.email});
}

@Entity()
class Device {
  int id; 

  String deviceId; 

  Device({this.id = 0, required this.deviceId});
}
