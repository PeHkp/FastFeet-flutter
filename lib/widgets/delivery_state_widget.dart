import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryStateWidget extends StatelessWidget {
  final int state;

  const DeliveryStateWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case 1:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: const Color(0xff00DA6D),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aguardando".toUpperCase(),
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff00DA6D)),
                    )
                  ],
                ),
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD7E0),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "RETIRADO",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffBEBCCC)),
                )
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD7E0),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "ENTREGUE",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffBEBCCC)),
                )
              ],
            ),
          ],
        );
      case 2:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: const Color(0xff00DA6D),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aguardando".toUpperCase(),
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff00DA6D)),
                    )
                  ],
                ),
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xff00DA6D),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "RETIRADO",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff00DA6D)),
                )
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD7E0),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "ENTREGUE",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffBEBCCC)),
                )
              ],
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: const Color(0xff00DA6D),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aguardando".toUpperCase(),
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff00DA6D)),
                    )
                  ],
                ),
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xff00DA6D),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "RETIRADO",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff00DA6D)),
                )
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xff00DA6D),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "ENTREGUE",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff00DA6D)),
                )
              ],
            ),
          ],
        );
      default:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                          color: const Color(0xffDAD7E0),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Aguardando".toUpperCase(),
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xffDAD7E0)),
                    )
                  ],
                ),
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD7E0),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "RETIRADO",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffDAD7E0)),
                )
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
            Column(
              children: [
                Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      color: const Color(0xffDAD7E0),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "ENTREGUE",
                  style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffDAD7E0)),
                )
              ],
            ),
          ],
        );
        ;
    }
  }
}
