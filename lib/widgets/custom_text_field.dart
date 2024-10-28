import 'package:flutter/material.dart';
import 'package:jotit_app/helper/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved,});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  // final TextEditingController? controller;
  // final InputDecoration? decoration ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        }else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: buildBolder(),
          enabledBorder: buildBolder(),
          focusedBorder: buildBolder(kPrimaryColor),
          hintText: hint,
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          )),
    );
  }
}

OutlineInputBorder buildBolder([color]) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ));
}
