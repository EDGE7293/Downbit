import 'package:web_socket_channel/io.dart';
import 'dart:convert';

class WebSocketService {
  IOWebSocketChannel? _channel;
  final String url = 'wss://api.upbit.com/websocket/v1';

  Stream connect({List<String>? codes}) {
    _channel = IOWebSocketChannel.connect(url);
    _channel?.sink.add(json.encode([
      {"ticket": "tickerReq1"},
      {"type": "ticker", "codes": codes ?? []}
    ]));
    return _channel!.stream;
  }

  void dispose() {
    _channel?.sink.close();
  }
}