import 'package:fast_feet/pages/home/widget/delivery_state_widget.dart';
import 'package:fast_feet/routes/routes.dart';
import 'package:fast_feet/services/firebase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final int _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff4C33CC),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            RotatedBox(
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
          ],
          centerTitle: false,
          title: Column(
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
          )),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: const Color(0xff4C33CC),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          margin: const EdgeInsets.only(right: 25),
                          child: const Divider(
                            color: Color(0xffDAD7E0),
                          ))),
                  Text(
                    "10 Decks",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.view_carousel_rounded,
                                  color: Color(0xffFFC042),
                                  size: 34,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Matematica",
                                  style: GoogleFonts.robotoCondensed(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xff4C4766)),
                                ),
                              ],
                            ),
                            const Text("10 cartas")
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            child: DeliveryStateWidget(
                              state: _index,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    color: const Color(0xffFFF1D6),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
