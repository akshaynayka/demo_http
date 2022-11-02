import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  String? id;
  String? title;
  bool? completed;
  String? userId;

  UserData({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'completed': completed,
        'userId': userId,
      };

  static UserData fromJson(Map<String, dynamic> json) => UserData(
        id: json['id'].toString(),
        title: json['title'],
        completed: json['completed'],
        userId: json['userId'].toString(),
      );
}
