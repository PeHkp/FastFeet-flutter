import 'package:fast_feet/pages/home/bloc/home_bloc.dart';
import 'package:fast_feet/pages/home/bloc/home_event.dart';
import 'package:fast_feet/pages/home/bloc/home_state.dart';
import 'package:fast_feet/services/delivery/delivery_model.dart';
import 'package:fast_feet/widgets/delivery_state_widget.dart';
import 'package:fast_feet/services/delivery/delivery_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryCardWidget extends StatelessWidget {
  DeliveryType item;
  DeliveryCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/box.svg"),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        item.nome,
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff4C4766)),
                      ),
                    ],
                  ),
                  Text(
                    item.data,
                    style: GoogleFonts.robotoCondensed(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff6F6C80)),
                  ),
                ],
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: DeliveryStateWidget(
                    state: item.state,
                  )),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 450,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/box.svg"),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                item.nome,
                                style: GoogleFonts.robotoCondensed(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff4C4766)),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff4C4766),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Endereço",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff4C4766)),
                            ),
                            Text(
                              item.adreess,
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff4C4766)),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xffDAD7E0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Data",
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff4C4766)),
                            ),
                            Text(
                              item.data,
                              style: GoogleFonts.robotoCondensed(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff4C4766)),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color(0xffDAD7E0),
                      ),
                      Center(
                        child: Text(
                          "Status",
                          style: GoogleFonts.robotoCondensed(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff4C4766)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DeliveryStateWidget(
                        state: item.state,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      BlocProvider(
                        create: (_) => HomePageBloc(),
                        child: BlocConsumer<HomePageBloc, HomePageState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color(0xff4C33CC),
                                  ),
                                  onPressed: () {
                                    context.read<HomePageBloc>().add(
                                        GetMyDeliveryEvent(delivery: item));
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Fazer entrega",
                                    style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xffFFC042)),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            height: 60,
            color: const Color(0xffFFF1D6),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Detalhes",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff4C4766)),
                ),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  size: 30,
                  color: Color(0xff4C4766),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
