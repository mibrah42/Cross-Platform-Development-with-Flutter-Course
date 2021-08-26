import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:chatly/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatScreen extends StatelessWidget {
  final User user;

  ChatScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  Future<void> _handleSendMessage(BuildContext context) async {
    if (_messageController.text.trim().isNotEmpty) {
      try {
        await _db.collection('messages').add({
          'id': user.uid,
          'name': user.displayName!,
          'message': _messageController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        _messageController.text = "";
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: kPurpleColor,
            content: Text(
              'Failed to send message',
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: kDarkGrey,
        appBar: AppBar(
          backgroundColor: kPurpleColor,
          centerTitle: true,
          title: const Text(
            'Chatly',
            style: TextStyle(
              fontFamily: 'VT323',
              fontSize: 32,
              color: kDarkGrey,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                try {
                  _auth.signOut();
                } catch (e) {
                  showOkAlertDialog(
                    context: context,
                    title: 'Sign Out Failed',
                    message: 'Please try again',
                  );
                }
              },
              icon: const Icon(
                Icons.logout,
                color: kDarkGrey,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _db
                        .collection('messages')
                        .orderBy('createdAt', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('failed to fetch messages'),
                        );
                      }

                      if (snapshot.hasData) {
                        // handle messages
                        return ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final message = snapshot.data!.docs[index];
                            return Row(
                              mainAxisAlignment: user.uid == message['id']
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 300),
                                    padding: const EdgeInsets.all(16.0),
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: user.uid == message['id'] as String
                                          ? kPurpleColor
                                          : kLightGrey,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message['name'] as String,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          message['message'] as String,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        if (message['createdAt'] != null)
                                          Text(
                                            message['createdAt'] == null
                                                ? 'a moment ago'
                                                : timeago.format(
                                                    message['createdAt']
                                                        .toDate() as DateTime,
                                                  ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                  color: Colors.grey[200],
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }

                      return const SizedBox.shrink();
                    }),
              ),
              Container(
                color: kLightGrey,
                constraints: const BoxConstraints(
                  maxHeight: 300,
                  minHeight: 70,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        style: TextStyle(
                          color: Colors.grey[400],
                        ),
                        cursorColor: kPurpleColor,
                        maxLines: 5,
                        minLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16.0),
                          fillColor: kLightGrey,
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Add Text',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _handleSendMessage(context),
                      icon: Icon(
                        Icons.send,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
