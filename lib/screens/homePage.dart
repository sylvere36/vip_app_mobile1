import 'package:vip1/services/bloc/vipBloc.dart';
import 'package:vip1/utils/UIData.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    blocVip.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsData.colorsPrimary,
        title: Text(ExtraString.appName),
      ),
      body: Center(

      ),
    );
  }
}