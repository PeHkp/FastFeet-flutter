import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_event.dart';
import 'package:fast_feet/pages/forgot_password/bloc/forgot_password_state.dart';
import 'package:fast_feet/routes/routes.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4C33CC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
              listener: (context, state) {
            switch (state.runtimeType) {
              case ErrorState:
                ErrorState errorState = state as ErrorState;
                final snackBar = SnackBar(
                  content: Text(
                    errorState.message!,
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 2),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;

              case SendEmailSuccessState:
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => true);
                break;
              default:
            }
          }, builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.login, (route) => true);
                          },
                        ),
                        SvgPicture.asset("assets/icons/logo_icone.svg"),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                        "Para recuperar sua senha, insira seu email cadastrado!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xffD5CCFF)))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value!)) {
                          return "*E-mail inválido.\nTem certeza de que este é o seu E-mail?";
                        }
                      },
                      controller: _emailController,
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
                          hintText: "E-mail",
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color(0xffFFC042),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                          onPressed:
                              state.runtimeType == LoadingForgotPasswordState
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<ForgotPasswordBloc>().add(
                                            SendForgotPasswordEvent(
                                                email: _emailController.text));
                                      }
                                    },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffFFC042))),
                          child: state.runtimeType == LoadingForgotPasswordState
                              ? SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                  ),
                                )
                              : Text(
                                  "Cadastrar",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xff4C4766))),
                                )),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
