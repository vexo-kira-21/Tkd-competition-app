
import 'package:flutter/material.dart';
import 'match.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tournament System")),
      body: Center(
        child: ElevatedButton(
          child: Text("Start Match"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MatchScreen()),
            );
          },
        ),
      ),
    );
  }
}