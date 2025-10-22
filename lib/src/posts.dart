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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tasks[index]['title'],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(tasks[index]['body']),
                    ],
                  )
                );
              },
            ),
      ),
    );
  }
}
