import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ta_capstone/presentation/pages/dashboard/home_screen.dart';
import 'package:ta_capstone/presentation/pages/dashboard/navigation.dart';
import 'package:ta_capstone/presentation/widget/button.dart';
import 'package:ta_capstone/share/app_colors/colors.dart';
import 'package:ticket_widget/ticket_widget.dart';

class CetakTiket extends StatelessWidget {
  const CetakTiket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: HomeClipper(),
            child: Container(
              height: 250,
              color: AppColors.LightGreen500,
            ),
          ),
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 70,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/white.png',
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 35,
                        ),
                        child: Center(
                          child: TicketWidget(
                            width: 350,
                            height: 500,
                            isCornerRounded: true,
                            padding: EdgeInsets.all(20),
                            child: TicketData(),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonComponent(
            title: 'Download E - Ticket',
            onPressed: () {
              Get.to(
                () => NavigationView(),
              );
            },
          ),
        )
      ],
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
