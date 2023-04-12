import 'package:fast_feet/pages/login/bloc/login_bloc.dart';
import 'package:fast_feet/pages/login/bloc/login_event.dart';
import 'package:fast_feet/pages/login/bloc/login_state.dart';
import 'package:fast_feet/routes/routes.dart';
import 'package:fast_feet/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4C33CC),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
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
                SendEmailSuccessState sendEmailSuccessState =
                    state as SendEmailSuccessState;
                final snackBar = SnackBar(
                  content: Text(
                    sendEmailSuccessState.message!,
                    textAlign: TextAlign.center,
                  ),
                  duration: const Duration(seconds: 2),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                break;
              case SuccessState:
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.home, (route) => true);
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
                        SvgPicture.asset("assets/icons/logo_icone.svg"),
                        SvgPicture.asset(
                          "assets/icons/logo.svg",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text("Entregador,",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 48,
                                fontStyle: FontStyle.italic,
                                color: Color(0xffFFC042)))),
                    Text("você é nosso\nmaior valor",
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 48,
                                fontStyle: FontStyle.italic,
                                color: Colors.white))),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Faça seu login para\ncomeçar suas entregas.",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xffD5CCFF)))),
                    const SizedBox(
                      height: 64,
                    ),
                    TextFieldWidget(
                      controller: _emailController,
                      hint: "E-mail",
                      icon: Icons.mail,
                      type: TypesTextField.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      controller: _passwordController,
                      hint: "Senha",
                      icon: Icons.lock,
                      type: TypesTextField.password,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                checkColor: const Color(0xff4C33CC),
                                fillColor:
                                    MaterialStateProperty.all(Colors.white),
                                value: state.rememberMe,
                                onChanged: (bool? value) {}),
                            Text("Lembrar-me",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Color(0xffD5CCFF)))),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.forgotPassword);
                            },
                            child: Text("Esqueci minha senha",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Color(0xffD5CCFF)))))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                          onPressed: state.runtimeType == LoadingLoginState
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(SignInEvent(
                                        email: _emailController.text,
                                        password: _passwordController.text));
                                  }
                                },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffFFC042))),
                          child: state.runtimeType == LoadingLoginState
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
                                  "Entrar",
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xff4C4766))),
                                )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: Text("Não tenho cadastro.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: Color(0xffD5CCFF)))))
                      ],
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
