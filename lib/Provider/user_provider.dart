import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {  // ChangeNotifier is a class that provides change notification to its listeners.
  String _username = '';
  String _email = '';
  String _password = '';
  String _gender = '';
  int _age = 0;
  String _height = '';
  String _weight = '';
  String _activityLevel = '';
  String _goal = '';

  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get gender => _gender;
  int get age => _age;
  String get height => _height;
  String get weight => _weight;
  
  String get goal => _goal;
  String get activityLevel => _activityLevel;

  void setUsername(String username) {
    _username = username;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setGender(String _gender){
    _gender = gender;
  }
  void setAge(int _age){
    _age = age;
  }

  void setHeight(String _height){
    _height = height;
  }

  void setWeight(String _weight){
    _weight = weight;
  }

  void setActivityLevel(String _activityLevel){
    _activityLevel = activityLevel;
  }
}