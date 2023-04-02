import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(''),
      ),
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int acceptedData = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Draggable(
          data: 10,
          feedback: Container(
            color: Colors.deepOrange,
            height: 100,
            width: 100,
            child: Icon(Icons.directions_run),
          ),
          childWhenDragging: Container(
            color: Colors.pinkAccent,
            height: 100,
            width: 100,
            child: Center(
              child: Text('Child when dragging'),
            ),
          ),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.lightGreenAccent,
            child: const Center(
              child: Text('Draggable'),
            ),
          ),
        ),
        DragTarget<int>(builder: (
          BuildContext contex,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.cyan,
            child: Center(
              child: Text('value is updated to $acceptedData'),
            ),
          );
        },
        onAccept: (int data) {
          setState(() {
            acceptedData += data;
          });
        }),
      ],
    );
  }
}
