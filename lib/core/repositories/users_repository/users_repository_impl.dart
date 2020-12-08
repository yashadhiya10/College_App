import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';

import 'users_repository.dart';

@Singleton(as: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  static Firestore firestore = locator<Firestore>();

  static CollectionReference _userRef = firestore.collection("users");

  @override
  Future getUser(String userId) async {
    try {
      var userData = await _userRef.document(userId).get();
      return User.fromDocument(userData);
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  @override
  Future isRollNoExists(String rollNo) async {
    try {
      var result =
          await _userRef.where("rollNo", isEqualTo: rollNo).getDocuments();

      if (result.documents != null) {
        return result.documents.isNotEmpty;
      }

      return false;
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }

  @override
  Future storeUser(User user) async {
    try {
      await _userRef.document(user.id).setData(user.toJson());
    } catch (e) {
      return e?.message ?? "Something went wrong";
    }
  }
}
