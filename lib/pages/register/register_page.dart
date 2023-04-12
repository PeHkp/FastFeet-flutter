import 'package:fast_feet/pages/register/bloc/register_bloc.dart';
import 'package:fast_feet/pages/register/bloc/register_event.dart';
import 'package:fast_feet/pages/register/bloc/register_state.dart';
import 'package:fast_feet/routes/routes.dart';
import 'package:fast_feet/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4C33CC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<RegisterBloc, RegisterState>(
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

              case SuccessState:
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
                    Text("Faça seu cadastro para\ncomeçar suas entregas.",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Color(0xffD5CCFF)))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFieldWidget(
                      controller: _nameController,
                      hint: "Nome",
                      icon: Icons.person,
                      type: TypesTextField.text,
                    ),
                    const SizedBox(
                      height: 10,
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
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: ElevatedButton(
                          onPressed: state.runtimeType == LoadingRegisterState
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<RegisterBloc>().add(
                                        SignUpEvent(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            password:
                                                _passwordController.text));
                                  }
                                },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffFFC042))),
                          child: state.runtimeType == LoadingRegisterState
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
