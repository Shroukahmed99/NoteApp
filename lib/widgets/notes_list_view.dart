import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:jotit_app/widgets/custom_note_item.dart';

class NoteItemListView extends StatelessWidget {
  const NoteItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
       
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CustomNoteItem(
                notes: notes[index],
              ),
            );
          },
        );
      },
    );
  }
}
