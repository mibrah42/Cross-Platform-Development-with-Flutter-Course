import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class NoteDetailScreen extends StatelessWidget {
  final int index;

  NoteDetailScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  final _notes = Hive.box('notes');

  @override
  Widget build(BuildContext context) {
    final note = _notes.getAt(index);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              try {
                _notes.deleteAt(index);
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
            icon: Icon(
              Icons.delete_outline,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                DateFormat.MMMMEEEEd().format(note.date),
                style: Theme.of(context).textTheme.caption,
              ),
              const SizedBox(height: 32.0),
              Text(
                note.body,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
