import 'package:flutter/material.dart';
import 'package:alatmusik/services/constants/constants.dart';

class TxtInputForm extends StatelessWidget {
  const TxtInputForm({
    Key key,
    @required this.controller,
    this.label,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          labelText: label,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kGrey),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: kBlueColor))),
    );
  }
}
