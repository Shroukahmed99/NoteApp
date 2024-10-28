import 'package:flutter/material.dart';
import 'package:jotit_app/widgets/note_view_body.dart';

import '../widgets/add_note_buttom_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return const AddNoteButtomSheet();
              });
        },
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: const NoteViewBody(),
    );
  }
}
