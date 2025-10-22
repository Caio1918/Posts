import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Posts extends StatefulWidget {
  State<Posts> createState() {
    return PostsState();
  }
}

class PostsState extends State<Posts> {
  bool loading = false;
  List tasks = [];

  void fetchTasks() async{
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      setState(() {
        tasks = json.decode(response.body);
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
