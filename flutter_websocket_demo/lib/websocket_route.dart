import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketRoute extends StatefulWidget {
  const WebSocketRoute({super.key});

  @override
  State<WebSocketRoute> createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  TextEditingController _controller = TextEditingController();
  late IOWebSocketChannel channel;
  String _text = "";

  @override
  void initState() {
    //创建websocket连接
    channel = IOWebSocketChannel.connect('wss://echo.websocket.events');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('websocket示例'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(labelText: 'send a message'),
                )
            ),
            StreamBuilder(stream: channel.stream, builder: (context, snapshot) {
                //网络不通
                if(snapshot.hasError) {
                  _text = "网络不通。。。";
                } else if (snapshot.hasData) {
                  _text = "echo:" + snapshot.data;
                }
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(_text),
                );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

}
