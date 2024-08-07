import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_composite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gay_stickers/gay_srceens/gay_info_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GaySystemScreen extends StatefulWidget {
  const GaySystemScreen({super.key});

  @override
  State<GaySystemScreen> createState() => _GaySystemScreenState();
}

class _GaySystemScreenState extends State<GaySystemScreen> {
  RxBool _gayPurLo = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'Popin',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 24,
            width: 24,
            alignment: Alignment.center,
            child: Image.asset(
              'gay_assets/back.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(8, 17, 32, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(31).copyWith(bottom: 13),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(() => GayInfoScreen(
                        gayInfoScreen: 'Privacy Policy',
                      ));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                        fontFamily: 'Popin',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(8, 17, 32, 1)),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => GayInfoScreen(
                        gayInfoScreen: 'Terms of Use',
                      ));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(
                        fontFamily: 'Popin',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(8, 17, 32, 1)),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => GayInfoScreen(
                        gayInfoScreen: 'Support',
                      ));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Support',
                    style: TextStyle(
                        fontFamily: 'Popin',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(8, 17, 32, 1)),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () async {
                  if (!_gayPurLo.value) {
                    _gayPurLo.value = true;
                    final ApphudComposite restPuGay =
                        await Apphud.restorePurchases();

                    bool failPuGay = true;

                    if (restPuGay.purchases.isNotEmpty) {
                      for (final pu in restPuGay.purchases) {
                        if (pu.productId == 'premium') {
                          failPuGay = false;
                          final _gayPrefs =
                              await SharedPreferences.getInstance();
                          await _gayPrefs.setBool('2', true);
                          break;
                        }
                      }
                    }

                    if (failPuGay) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Text('Your purchase is not found',
                              style: TextStyle(
                                  fontFamily: 'Popin',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color.fromRGBO(8, 17, 32, 1))),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: Text('Your purchase has been restored',
                              style: TextStyle(
                                  fontFamily: 'Popin',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Color.fromRGBO(8, 17, 32, 1))),
                        ),
                      );
                    }

                    _gayPurLo.value = false;
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Obx(
                    () => _gayPurLo.value
                        ? CupertinoActivityIndicator()
                        : Text(
                            'Restore Purchase',
                            style: TextStyle(
                                fontFamily: 'Popin',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color.fromRGBO(8, 17, 32, 1)),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
