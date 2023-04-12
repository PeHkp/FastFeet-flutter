import 'package:fast_feet/pages/home/bloc/home_bloc.dart';
import 'package:fast_feet/pages/home/bloc/home_event.dart';
import 'package:fast_feet/pages/home/bloc/home_state.dart';
import 'package:fast_feet/pages/home/widget/delivery_card_widget.dart';
import 'package:fast_feet/routes/routes.dart';
import 'package:fast_feet/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff4C33CC),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10, top: 20),
              child: RotatedBox(
                quarterTurns: 2,
                child: IconButton(
                  icon: const Icon(Icons.exit_to_app_rounded),
                  onPressed: () {
                    AuthService().signout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.login, (route) => false);
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bem vindo,',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${AuthService().currentUser!.displayName}',
                  style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white)),
                ),
              ],
            ),
          )),
      body: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {},
          builder: (context, state) {
            context.read<HomePageBloc>().add(LoadingHomePageEvent());
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: const Color(0xff4C33CC),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.myDelivery);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xffFFC042))),
                        child: Text(
                          "Minhas entregas",
                          style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff4C4766))),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(right: 25),
                                child: const Divider(
                                  color: Color(0xffDAD7E0),
                                ))),
                        Text(
                          state.runtimeType == LoadingHomePageState
                              ? "Carregando Entregas"
                              : "${state.entregas!.length} Entregas",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xffBEBCCC)),
                        ),
                        Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 25),
                                child: const Divider(
                                  color: Color(0xffDAD7E0),
                                ))),
                      ],
                    ),
                  ),
                  state.entregas == []
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 100),
                          child: Center(
                            child: Text(
                              "Não tem entregas disponiveis no momento!",
                              style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xffBEBCCC)),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: state.runtimeType == LoadingHomePageState
                              ? Container(
                                  margin: const EdgeInsets.only(top: 100),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : SizedBox(
                                  height: 600,
                                  child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return DeliveryCardWidget(
                                          item: state.entregas![index],
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 20,
                                        );
                                      },
                                      itemCount: state.entregas!.length),
                                ))
                ],
              ),
            );
          }),
    );
  }
}
