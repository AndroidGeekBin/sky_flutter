import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_app/core/utils/color_utils.dart';

// ignore: must_be_immutable
class CommonButton extends StatelessWidget {
  final String title;
  final Color enableColor;

  final Color disableColor;
  final Color textColor;
  final bool enable;
  Function onClickListener;

  CommonButton(
      {@required this.title,
      this.textColor = Colors.white,
      this.enableColor = ThemeColor.green,
      this.disableColor = ThemeColor.green_1,
      this.enable = true,
      this.onClickListener});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 312,
        height: 50,
        child: new RaisedButton(
          onPressed: () {
            onClickListener.call();
          },
          child: Text(title),
          color: enable ? enableColor : disableColor,
          textColor: Colors.white,
          focusColor: enable ? enableColor : disableColor,
          splashColor: enable ? enableColor : disableColor,
          highlightColor: enable ? enableColor : disableColor,
          elevation: 10,
        ));
  }
}
