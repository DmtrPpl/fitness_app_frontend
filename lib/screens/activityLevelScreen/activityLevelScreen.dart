import 'dart:convert';
import 'package:fitness_app_live/Provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/DetailPageButton.dart';
import '../../models/DetailPageTitle.dart';
import '../../models/ListWheelViewScroller.dart';

class ActivityLevelPage extends StatefulWidget {
  const ActivityLevelPage({super.key});

  @override
  State<ActivityLevelPage> createState() => _ActivityLevelPageState();
}

class _ActivityLevelPageState extends State<ActivityLevelPage> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      'Rookie',
      'Beginner',
      'Intermediate',
      'Advanced',
      'Pro',
    ];

    var size = MediaQuery.of(context).size;
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          top: size.height * 0.06,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        child: Column(
          children: [
            const DetailPageTitle(
                text: 'This helps us to create a personlized plan for you',
                title: "What is your Activity Level?",
                color: Colors.white),
            SizedBox(
              height: size.height * 0.055,
            ),
            SizedBox(
              height: size.height * 0.5,
              child: listwheelScrollView(
                items: items,
              ),
            ),
            DetailPageButton(
              text: 'Next',
              onTap: () {
                registerUser(
                  email: userProvider.email,
                  password: userProvider.password,
                  age: userProvider.age,
                  gender: userProvider.gender,
                  weight: userProvider.weight,
                  height: userProvider.height,
                  goal: userProvider.goal,
                  activity: userProvider.activityLevel,
                );
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              showBackButton: true,
              onBackTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> registerUser({
  required String email,
  required String password,
  required int age,
  required String gender,
  required String weight,
  required String height,
  required String goal,
  required String activity,
}) async {
  const String apiUrl = 'http://192.168.0.61:8000/register';
  print(email);
  print(password);
  print(age);
  print(gender);
  print(weight);
  print(height);
  print(goal);
  print(activity);


  final response = await http.post(
    Uri.parse(apiUrl),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'age': age,
      'gender': gender,
      'weight': weight,
      'height': height,
      'goal': goal,
      'activity': activity,
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    if (responseBody['status'] == 'success') {
      print('User registered successfully');
    } else {
      print('Failed to register user: ${responseBody['message']}');
    }
  } else {
    print('Failed to register user: ${response.reasonPhrase}');
  }
}