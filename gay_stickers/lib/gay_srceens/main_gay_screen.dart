import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_stickers/gay_model.dart';
import 'package:gay_stickers/gay_srceens/gay_detail_screen.dart';
import 'package:gay_stickers/gay_srceens/gay_system_screen.dart';
import 'package:gay_stickers/gay_widgets/gay_card.dart';
import 'package:get/get.dart';

class MainGayScreen extends StatefulWidget {
  const MainGayScreen({super.key});

  @override
  State<MainGayScreen> createState() => _MainGayScreenState();
}

class _MainGayScreenState extends State<MainGayScreen> {
  final gays = [
    GayModel(
      gayId: 0,
      gayTitle: 'Gays',
      isGayFree: true,
      gayPaths: [
        'gay_assets/1_a.png',
        'gay_assets/1_b.png',
        'gay_assets/1_c.png',
        'gay_assets/1_d.png',
        'gay_assets/1_e.png',
        'gay_assets/1_f.png',
        'gay_assets/1_g.png',
        'gay_assets/1_h.png',
      ],
    ),
    GayModel(
      gayId: 1,
      gayTitle: 'Lesbian',
      isGayFree: true,
      gayPaths: [
        'gay_assets/2_a.png',
        'gay_assets/2_b.png',
        'gay_assets/2_c.png',
        'gay_assets/2_d.png',
        'gay_assets/2_e.png',
        'gay_assets/2_f.png',
        'gay_assets/2_g.png',
        'gay_assets/2_h.png',
      ],
    ),
    GayModel(
      gayId: 2,
      gayTitle: 'VIP LGBTQ+',
      isGayFree: false,
      gayPaths: [
        'gay_assets/3_a.png',
        'gay_assets/3_b.png',
        'gay_assets/3_c.png',
        'gay_assets/3_d.png',
        'gay_assets/3_e.png',
        'gay_assets/3_f.png',
        'gay_assets/3_g.png',
        'gay_assets/3_h.png',
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => GaySystemScreen());
            },
            child: Image.asset(
              'gay_assets/gay_set.png',
              height: 24,
              width: 24,
            ),
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(8, 17, 32, 1),
      body: SafeArea(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 30),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(
                () => GayDetailScreen(gayModel: gays[index]),
              );
            },
            child: GayCard(
              gayModel: gays[index],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 31,
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
