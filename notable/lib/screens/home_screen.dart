import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notable/models/note.dart';
import 'package:notable/screens/add_note_screen.dart';
import 'package:notable/screens/note_detail_screen.dart';
import 'package:notable/utilities/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _gridCell({
    required BuildContext context,
    required Note note,
    required int index,
  }) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteDetailScreen(
            index: index,
          ),
        ),
      ),
      child: Card(
        color: kLightGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  DateFormat.MMMMEEEEd().format(note.date),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(height: 8.0),
                Text(
                  note.body,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notable',
          style: TextStyle(
            fontFamily: 'Satisfy',
            fontSize: 32,
          ),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('notes').listenable(),
        builder: (context, Box<dynamic> notes, _) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 500 ? 4 : 2,
            ),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              Note note = notes.getAt(index);
              return _gridCell(
                context: context,
                note: note,
                index: index,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddNoteScreen.id),
        backgroundColor: kYellowColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
