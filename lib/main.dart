import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Offset _offset = Offset(0.4, 0.7);
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: <Widget>[
  //           const Text(
  //             'You have pushed the button this many times:',
  //           ),
  //           Text(
  //             '$_counter',
  //             style: Theme.of(context).textTheme.headline4,
  //           ),
  //           Transform.rotate(
  //             angle: -45 * (pi / 180.0),
  //             child: ElevatedButton(
  //               child: const Text("Rotated button"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform(
  //             transform: Matrix4.rotationZ(-45 * (pi / 180.0)),
  //             alignment: Alignment.center,
  //             child: ElevatedButton(
  //               child: const Text("Rotated button"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform.scale(
  //             scale: 2.0,
  //             child: ElevatedButton(
  //               child: const Text("scaled up"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform(
  //             transform: Matrix4.identity()..scale(2.0, 2.0),
  //             alignment: Alignment.center,
  //             child: ElevatedButton(
  //               child: const Text("scaled up (matrix)"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform.translate(
  //             offset: const Offset(100, 300),
  //             child: ElevatedButton(
  //               child: const Text("translated to bottom"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform(
  //             transform: Matrix4.translationValues(100, 300, 0),
  //             child: ElevatedButton(
  //               child: const Text("translated to bottom (matrix)"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Transform.translate(
  //             offset: const Offset(70, 200),
  //             child: Transform.rotate(
  //               angle: -45 * (pi / 180.0),
  //               child: Transform.scale(
  //                 scale: 2.0,
  //                 child: ElevatedButton(
  //                   child: const Text("multiple transformations"),
  //                   onPressed: () {},
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Transform(
  //             alignment: Alignment.center,
  //             transform: Matrix4.translationValues(70, 200, 0)
  //               ..rotateZ(-45 * (pi / 180.0))
  //               ..scale(2.0, 2.0),
  //             child: ElevatedButton(
  //               child: const Text("multiple transformations (matrix)"),
  //               onPressed: () {},
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _incrementCounter,
  //       tooltip: 'Increment',
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(0.01 * _offset.dy)
          ..rotateY(-0.01 * _offset.dx),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onPanUpdate: (details) => setState(() => _offset += details.delta),
          onDoubleTap: () => setState(() => _offset = Offset.zero),
          child: _defaultApp(context),
        ));
  }

  _defaultApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Matrix 3D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
