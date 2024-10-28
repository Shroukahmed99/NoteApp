import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jotit_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:jotit_app/models/note_model.dart';
import 'package:jotit_app/widgets/colors_list_view.dart';
import 'package:jotit_app/widgets/custom_buttom.dart';
import 'package:jotit_app/widgets/custom_text_field.dart';
import 'package:jotit_app/widgets/date_item.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({super.key});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 15),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(height: 25),
          // Use DateItem to select the date
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<AddNoteCubit>(context);
              return DateItem(
                date: cubit.date, // Use the date from the cubit
                onDateChanged: (newDate) {
                  cubit.updateDate(newDate); // Update the date in the cubit
                },
              );
            },
          ),
          const SizedBox(height: 25),
          const ColorsListView(),
          const SizedBox(height: 50),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButtom(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    // Create a new note and pass the saved values
                    var cubit = BlocProvider.of<AddNoteCubit>(context);
                    var noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: cubit.date, // Use the date from the cubit
                      color: cubit.color.value, // Use the color from the cubit
                    );

                    // Trigger cubit to add the note
                    cubit.addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
