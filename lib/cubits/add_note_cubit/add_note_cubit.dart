import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jotit_app/helper/constants.dart';
import 'package:jotit_app/models/note_model.dart';

part 'add_note_state.dart';

// 2-create cubit
class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = const Color(0xFF83B692);

 String date = DateFormat('yyyy-MM-dd').format(DateTime.now());

   updateDate(String newDate) {
    date = newDate;
  }
  
  // 3-Add Method (create functions)
  addNote(NoteModel note) async {
    note.date = date;
  
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(errorMessage: e.toString()));
    }
  }
}
