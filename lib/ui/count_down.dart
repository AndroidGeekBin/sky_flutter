import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_app/core/utils/color_utils.dart';
import 'package:sky_app/core/utils/string_utils.dart';

// ignore: must_be_immutable
class TimerCountDownWidget extends StatefulWidget {
  Function onTimerFinish;

  TimerCountDownWidget({this.onTimerFinish}) : super();

  @override
  _TimerCountDownWidgetState createState() => _TimerCountDownWidgetState();
}

class _TimerCountDownWidgetState extends State<TimerCountDownWidget> {
  Timer _timer;
  int _countdownTime = 0;
  bool finish = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        finish = false;
        if (_countdownTime == 0) {
          setState(() {
            _countdownTime = 6;
          });
          startCountdownTimer();
        }
      },
      child: Container(
        width: 60,
        alignment: Alignment.center,
        child: Text(
          _countdownTime > 0 ? '$_countdownTime s' : (finish ? StringUtils
              .LOGIN_OPT:StringUtils.LOGIN_RESEND),
          style: TextStyle(
            fontSize: 16,
            color: ThemeColor.green,
          ),
        ),
      ),
    );
  }

  void startCountdownTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) =>
        {
          setState(() {
            if (_countdownTime < 1) {
              widget.onTimerFinish();
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        });
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
