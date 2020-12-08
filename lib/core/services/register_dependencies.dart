import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class RegisterDependencies {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  Firestore get firestore => Firestore.instance;

  @singleton
  HiveInterface get hive => Hive;

  @singleton
  Client get client => Client();

  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  SnackbarService get snackbarService;
}
