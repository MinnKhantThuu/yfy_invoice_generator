import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  static const Color accentColor = Color(0xff174066);
  bool isTextArea = false;
  bool isNumKeyboard = false;

  TextInput({
    Key? key,
    required this.controller,
    required this.text,
    this.isTextArea = false,
    this.isNumKeyboard = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 30,
        child: TextFormField(
          // autofocus: true,
          keyboardType:
              isNumKeyboard ?  TextInputType.number : TextInputType.multiline,
          textInputAction: TextInputAction.next,
          maxLines: isTextArea ? 3 : 1,
          controller: controller,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            labelText: text,
            labelStyle: const TextStyle(
              color: accentColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(
                color: accentColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(
                color: accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
