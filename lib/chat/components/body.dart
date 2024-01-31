import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<Body> {
  final List<Message> messages = [];
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Simulate receiving messages
    _receiveMessage("Hello! Welcome to AutoCareHub, How may i help you today?", "User 1");
  }

  void _sendMessage(String text) async {
    final newMessage = Message(sender: "User", text: text, timestamp: DateTime.now());
    setState(() {
      messages.add(newMessage);
    });
    textController.clear();
    _scrollToBottom();
    print('Sending message: $text');
    final requestBody = {
      'in-0': text,
    };

    // Construct the headers, including Authorization if needed
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'xxxxxxxxxxxxxxxxxxx', // Replace with your actual token
    };

    try {
      final response = await http.post(
        Uri.parse(
            'https://www.stack-inference.com/run_deployed_flow?flow_id=65058519d24fae1d5df6242e&org=9642c95f-e49f-4213-bfdb-16cff7436289'),
        headers: headers,
        body: json.encode(requestBody), // Convert the request body to JSON
      );

      if (response.statusCode == 200) {
        // Successful response
        final responseBody = json.decode(response.body);
        final answer = responseBody['out-0']; // Assuming the response has a key 'out-0' for the answer
        _receiveMessage(answer, "Bot");
      } else {
        // Handle errors
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the HTTP request
      print('Error sending message: $e');
    }

    textController.clear();
    _scrollToBottom();
  }

  void _receiveMessage(String text, String sender) {
    print('Received message: $text from $sender');
    final newMessage =
    Message(sender: sender, text: text, timestamp: DateTime.now());
    setState(() {
      messages.add(newMessage);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AutoCareHub Chat Assistant",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF3C8ED3),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return MessageWidget(message: message);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final text = textController.text;
                    if (text.isNotEmpty) {
                      _sendMessage(text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final DateTime timestamp;

  Message({required this.sender, required this.text, required this.timestamp});
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.sender == 'User' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: message.sender == 'User' ? Color(0xFF3C8ED3) : Colors.orangeAccent,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
