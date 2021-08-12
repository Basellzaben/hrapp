import 'package:flutter/cupertino.dart';

//work state data
class Post {
  final int id;
  final String description;
  final int count;

  Post({
    required this.id,
    required this.description,
    required this.count,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['Id'] as int,
      description: json['Description'] as String,
      count: json['Count'] as int,
    );
  }
}
/*
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}*/
