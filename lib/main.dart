import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  Todo(String this.title, String this.description);

  final title, description;
}

final todos = [
  Todo('Todo 1', 'Description 1'),
  Todo('Todo 2', 'Description 2'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter todo app',
        theme: ThemeData(
          primaryColor: Colors.green
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Todo app')),
              backgroundColor: Colors.purple.shade700,
            ),
            body: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              todos[index].title.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Container(
                              child: Text(
                                todos[index].description.toString(),
                                textAlign: TextAlign.left,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 100)
                        ],
                      ),
                      height: 200,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.orange.shade400));
                }),
                floatingActionButton: FloatingActionButton(onPressed: (){
                  final newTodo = Todo('Title from fab', 'description from fab');
                  todos.add(newTodo);
                },
                backgroundColor: Colors.red,
                child: Icon(Icons.add)),
              ));
  }
}
