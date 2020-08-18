import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset("images/home_bg.png"),
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 14, top: 37.5, bottom: 22),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Loan  rejections solutions for",
                          style: TextStyle(color: Colors.white,fontFamily:'Helve'))),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            text: "1.224.578",
                            style: TextStyle(fontSize: 24),
                            children: [
                              TextSpan(
                                  text: " people",
                                  style: TextStyle(fontSize: 15))
                            ]),
                      )),
                  _buildDescWidget(context)
                ],
              ),
            ),
          )
        ],
      ),
    );

//      child: Stack(
//        children: <Widget>[
//          Positioned(
//            top: 30,
//            left: 20,
//            child: RaisedButton(
//              child: Text("Login"),
//              onPressed: () {
//                Navigator.of(context).push(
//                    MaterialPageRoute(builder: (context) => LoginWidget()));
//              },
//            ),
//          )
//        ],
//      ),
  }

  _buildDescWidget(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Text(
              "Worried why your loan is\nalways rejected?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Your credit may have following risks:",
                style: TextStyle(fontSize: 12,color: Color(0xff909399)),
              ),
            )
          ],
        ));
  }
}
