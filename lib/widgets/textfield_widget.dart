import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TypesTextField { text, email, password }

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final TypesTextField type;

  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.hint,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (type == TypesTextField.text) {
          if (value!.isEmpty || value == "") {
            return "O campo nome é obrigatorio!";
          }
        }
        if (type == TypesTextField.email) {
          if (!EmailValidator.validate(value!)) {
            return "*E-mail inválido.\nTem certeza de que este é o seu E-mail?";
          }
        }

        return null;
      },
      autocorrect: false,
      controller: controller,
      keyboardType: type == TypesTextField.email
          ? TextInputType.emailAddress
          : TextInputType.text,
      cursorColor: const Color(0xffBEBCCC),
      obscureText: type == TypesTextField.password ? true : false,
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
