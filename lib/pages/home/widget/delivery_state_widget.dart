import 'package:flutter/material.dart';

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
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
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
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
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
          ],
        );
      case 2:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
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
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
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
          ],
        );
      case 3:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
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
            const Expanded(
                child: Divider(
              color: Color(0xff00DA6D),
            )),
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
          ],
        );
      default:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                    child: Divider(
                  color: Color(0xffDAD7E0),
                )),
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
              ],
            ),
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
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
            const Expanded(
                child: Divider(
              color: Color(0xffDAD7E0),
            )),
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
          ],
        );
    }
  }
}
