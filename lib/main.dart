import 'package:flutter/material.dart';

void main() {
  ErrorWidget.builder = (details) {
    bool _inDebug = false;

    assert(() {
      _inDebug = true;
      return true;
    }());

    if (_inDebug) {
      return ErrorWidget(details);
    }
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Error\n ${details.exception}',
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          fontSize: 24,
          decoration: TextDecoration.none,
        ),
        textAlign: TextAlign.center,
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Widget',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 74),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_text!),
            ElevatedButton(
              onPressed: () => setState(() {
                _text = null;
              }),
              child: const Text('Show error'),
            ),
          ],
        ),
      ),
    );
  }
}
