import 'package:flutter/material.dart';
import 'package:sky_app/core/utils/string_utils.dart';

class MePage extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          StringUtils.TITLE_ME,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(AssetImage('images/me_no_message.png')),
            onPressed: () {
              Navigator.pushNamed(context, StringUtils.ROUTE_MESSAGE);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Image.asset('images/me_title_bg.png'),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: _buildWidget(context),
                  padding: EdgeInsets.only(left: 16,top: 20),
                ),
                _buildSetting(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSetting(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 16,top: 50),
      child:Column(
        children: <Widget>[
        Text('aaa')
        ],
      ) ,
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'images/me_user.png',
            height: 56,
            width: 56,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  StringUtils.ROUTE_ID,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  '13645646031',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
