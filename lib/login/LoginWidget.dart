
import 'package:sky_app/core/utils/color_utils.dart';
import 'package:sky_app/core/utils/log_utils.dart';
import 'package:sky_app/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:sky_app/ui/common_btn.dart';
import 'package:sky_app/ui/count_down.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _marginLeft = 24;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'images/login_img_1.png',
                      width: 122,
                      height: 123,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 42),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'images/login_img_2.png',
                    width: 69,
                    height: 98,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: _marginLeft, top: 49),
              child: Text(
                StringUtils.LOGIN_TITLE,
                style:
                    TextStyle(fontSize: _marginLeft, color: Color(0xFF303133)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: _marginLeft, right: _marginLeft, top: 90),
              child: _buildInputMobileWidget(context),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: _marginLeft, right: _marginLeft, top: 14),
                child: _buildOptWidget(context)),
            Padding(
              padding: EdgeInsets.only(top: 55),
              child: CommonButton(
                title: StringUtils.LOGIN_BTN,
                onClickListener: () {
                  BoxLog.debug("login click");
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: _buildRichText(context),
            ),
          ],
        ));
  }

  Widget _buildRichText(BuildContext context) {
    return new RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: StringUtils.LOGIN_RICH_1,
          style: TextStyle(
            fontSize: 12,
              color: ThemeColor.gray_2
          )
        ),
        TextSpan(
            text: StringUtils.LOGIN_RICH_2,
          style: TextStyle(
              fontSize: 12,
            color: ThemeColor.yellow_1
          )
        ),
        TextSpan(
            text: StringUtils.LOGIN_RICH_3,
            style: TextStyle(
                fontSize: 12,
                color: ThemeColor.yellow_1
            )
        ),
        TextSpan(
            text: StringUtils.LOGIN_RICH_4,
            style: TextStyle(
                fontSize: 12,
                color: ThemeColor.gray_2
            )
        ),
        TextSpan(
            text: StringUtils.LOGIN_RICH_5,
            style: TextStyle(
                fontSize: 12,
                color: ThemeColor.yellow_1
            )
        )
      ]),
    );
  }

  Widget _buildInputMobileWidget(BuildContext context) {
    return new SizedBox(
      height: 48,
      child: Stack(
        children: <Widget>[
          TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 50),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.3, color: ThemeColor.gray_2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(width: 0.3, color: ThemeColor.gray_2),
                ),
                hintText: StringUtils.LOGIN_HINT_MOBILE,
                hintStyle: TextStyle(color: ThemeColor.gray_2, fontSize: 16),
              )),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '+91',
                style: TextStyle(color: Color(0xFF303133)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 11),
                child: VerticalDivider(
                  indent: 12,
                  endIndent: 12,
                  color: ThemeColor.gray_2,
                  width: 0.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptWidget(BuildContext context) {
    return new SizedBox(
      child: Stack(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.3,
                  color: ThemeColor.gray_2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 0.3,
                color: ThemeColor.green,
              )),
              hintText: StringUtils.LOGIN_HINT_OPT,
              hintStyle: TextStyle(
                color: ThemeColor.gray_2,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 10),
                    child: SizedBox(
                      width: 0.5,
                      height: 16,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: ThemeColor.gray_2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, right: 10),
                    child: TimerCountDownWidget(
                      onTimerFinish: () {
                        //TODO 倒计时结束
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
