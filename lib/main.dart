import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jotit_app/helper/constants.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:jotit_app/helper/simple_bloc_observer.dart';
import 'package:jotit_app/views/note_view.dart';
import 'cubits/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
      NoteModelAdapter()); // guide app to use hive with NoteModel (i choose the udapter that i want to hive use it in my app)
  await Hive.openBox<NoteModel>(kNotesBox);
  Bloc.observer =
      SimpleBlocObserver(); // can hook into lifecycle events of your Blocs/Cubits
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => NotesCubit(),
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        title: 'NoteApp',
        home:  const NoteView(),
      ),
    );
  }
}
