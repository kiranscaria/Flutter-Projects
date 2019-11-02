import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble(
      {@required this.sender, @required this.text, @required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            !isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          !isMe
              ? Text(
                  sender,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                )
              : Text(''),
          Material(
              borderRadius: !isMe
                  ? BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(15),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15),
//                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(30),
                    ),
              elevation: 5.0,
              color: !isMe ? Colors.lightBlueAccent : Colors.lightGreen,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  '$text',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
