import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gay_stickers/gay_model.dart';

class GayCard extends StatefulWidget {
  final GayModel gayModel;
  const GayCard({super.key, required this.gayModel});

  @override
  State<GayCard> createState() => _GayCardState();
}

class _GayCardState extends State<GayCard> {
  final _gayCardController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 17, right: 17, bottom: 14),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.gayModel.gayTitle,
                  style: TextStyle(
                      fontFamily: 'Popin',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Color.fromRGBO(8, 17, 32, 1)),
                ),
              ),
              Text(
                widget.gayModel.gayPaths.length.toString(),
                style: TextStyle(
                    fontFamily: 'Popin',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              ),
              SizedBox(
                width: 3,
              ),
              Image.asset(
                'gay_assets/sticker_cnt.png',
                height: 13,
                width: 13,
              ),
              SizedBox(
                width: 13,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3.5, horizontal: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.gayModel.isGayFree
                      ? Color.fromRGBO(83, 131, 224, 1)
                      : Color.fromRGBO(137, 83, 224, 1),
                ),
                child: Text(
                  widget.gayModel.isGayFree ? 'FREE' : '1.99 \$',
                  style: TextStyle(
                      fontFamily: 'Popin',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 19,
          ),
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  widget.gayModel.gayPaths[0],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Image.asset(
                  widget.gayModel.gayPaths[1],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Image.asset(
                  widget.gayModel.gayPaths[2],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ExpandableNotifier(
            controller: _gayCardController,
            child: Expandable(
              collapsed: GestureDetector(
                onTap: () {
                  _gayCardController.toggle();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(83, 131, 224, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Watch all',
                    style: TextStyle(
                        fontFamily: 'Popin',
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ),
              ),
              expanded: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          widget.gayModel.gayPaths[3],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Image.asset(
                          widget.gayModel.gayPaths[4],
                        ),
                      ),
                      SizedBox(
                        width: 15,
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
                        width: 15,
                      ),
                      Expanded(
                        child: Image.asset(
                          widget.gayModel.gayPaths[7],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      _gayCardController.toggle();
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(83, 131, 224, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Hide',
                        style: TextStyle(
                            fontFamily: 'Popin',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
