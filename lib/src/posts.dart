import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  State<Posts> createState() {
    return PostsState();
  }
}

class PostsState extends State<Posts> {
  bool loading = false;
  List tasks = [];

  void fetchTasks() {}

  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
