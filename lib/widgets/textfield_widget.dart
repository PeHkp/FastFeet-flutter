// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty || value == "") {
          return "O campo nome é obrigatorio!";
        }
        return null;
      },
      autocorrect: false,
      controller: controller,
      cursorColor: const Color(0xffBEBCCC),
      style: GoogleFonts.inter(
        textStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xffBEBCCC),
        ),
      ),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.all(20.0),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(5)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(5)),
          prefixIcon: Icon(
            icon,
            color: const Color(0xffFFC042),
          )),
    );
  }
}
