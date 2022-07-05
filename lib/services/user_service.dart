import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_apps/models/user_model.dart';

class UserService {
  final CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userReference.doc(id).get();
      return UserModel(
        email: snapshot['email'],
        id: id,
        name: snapshot['name'],
        balance: snapshot['balance'],
        hobby: snapshot['hobby'],
      );
    } catch (e) {
      rethrow;
    }
  }
}
