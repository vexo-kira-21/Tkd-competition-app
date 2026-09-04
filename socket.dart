
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketService {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.1.5:3000'),
  );

  void send(Map data) {
    channel.sink.add(jsonEncode(data));
  }
}
