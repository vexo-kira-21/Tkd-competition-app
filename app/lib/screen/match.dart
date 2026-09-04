import 'package:flutter/material.dart';
import '../services/socket.dart';

class MatchScreen extends StatelessWidget {
  final socket = SocketService();

  void send(String fighter) {
    socket.send({"type": "score", "fighter": fighter});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Match")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => send("red"), child: Text("RED +1")),
              ElevatedButton(onPressed: () => send("blue"), child: Text("BLUE +1")),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              socket.send({"type": "penalty", "fighter": "red"});
            },
            child: Text("GAM-JEOM RED"),
          )
        ],
      ),
    );
  }
}