import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gay_stickers/gay_model.dart';
import 'package:gay_stickers/gay_srceens/gay_system_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preference_app_group/shared_preference_app_group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GayDetailScreen extends StatefulWidget {
  final GayModel gayModel;
  const GayDetailScreen({super.key, required this.gayModel});

  @override
  State<GayDetailScreen> createState() => _GayDetailScreenState();
}

class _GayDetailScreenState extends State<GayDetailScreen> {
  RxBool _isGaySelected = false.obs;
  RxBool _isGayLoad = true.obs;
  RxBool _isGayBought = true.obs;

  Future<void> _checkSavedGay() async {
    if (!widget.gayModel.isGayFree) {
      final _gayPrefs = await SharedPreferences.getInstance();
      _isGayBought.value =
          _gayPrefs.getBool(widget.gayModel.gayId.toString()) ?? false;
    }
    await SharedPreferenceAppGroup.setAppGroup('group.dundukov');
    final curSelGay = await SharedPreferenceAppGroup.getInt('stick_type') ?? 0;
    _isGaySelected.value = curSelGay == widget.gayModel.gayId;

    _isGayLoad.value = false;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _checkSavedGay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.gayModel.gayTitle,
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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(31).copyWith(bottom: 13),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 22),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[0],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[1],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[2],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[3],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[4],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[5],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[6],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Image.asset(
                            widget.gayModel.gayPaths[7],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27,
              ),
              GestureDetector(
                onTap: () async {
                  if (!_isGayLoad.value) {
                    if (!_isGayBought.value) {
                      _isGayLoad.value = true;
                      final pwlsGay = await Apphud.paywalls();
                      print(pwlsGay?.paywalls.first.products!
                          .where((element) => element.productId == 'pack_turbo')
                          .toList()
                          .first);

                      final purGay = await Apphud.purchase(
                        product: pwlsGay?.paywalls.first.products!
                            .where((fodpofdopfd) =>
                                fodpofdopfd.productId == 'pack_turbo')
                            .toList()
                            .first,
                      );
                      if (purGay.error == null) {
                        final _gayPrefs = await SharedPreferences.getInstance();
                        await _gayPrefs.setBool(
                            widget.gayModel.gayId.toString(), true);
                        _isGayBought.value = true;
                      }

                      _isGayLoad.value = false;
                    } else if (_isGayBought.value && !_isGaySelected.value) {
                      _isGayLoad.value = true;
                      await SharedPreferenceAppGroup.setAppGroup(
                          'group.dundukov');
                      await SharedPreferenceAppGroup.setInt(
                          'stick_type', widget.gayModel.gayId);
                      _isGaySelected.value = true;
                      _isGayLoad.value = false;
                    }
                  }
                },
                child: Obx(
                  () => Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 13,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _isGaySelected.value
                            ? Color.fromRGBO(255, 255, 255, 1)
                            : Color.fromRGBO(83, 131, 224, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Obx(
                      () => _isGayLoad.value
                          ? CupertinoActivityIndicator()
                          : Text(
                              _isGayBought.value
                                  ? _isGaySelected.value
                                      ? 'Selected'
                                      : 'Select'
                                  : 'Buy 1.99 \$',
                              style: TextStyle(
                                  fontFamily: 'Popin',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: _isGaySelected.value
                                      ? Color.fromRGBO(8, 17, 32, 1)
                                      : Color.fromRGBO(255, 255, 255, 1)),
                            ),
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
