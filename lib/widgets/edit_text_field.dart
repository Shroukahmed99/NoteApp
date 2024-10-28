import 'package:flutter/material.dart';
import 'package:jotit_app/helper/constants.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({super.key, this.controller, this.maxLines=1, this.labelText});
  final TextEditingController? controller;
  final int? maxLines ;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
          labelText:labelText ,
          labelStyle:const TextStyle(
            color: kPrimaryColor,
            fontSize: 30,
          )),
          maxLines:maxLines ,
    );
  }
}
