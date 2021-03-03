import 'package:vip1/locator.dart';
import 'package:vip1/providers/authProvider.dart';
import 'package:vip1/utils/NavigateHelper.dart';
import 'package:vip1/utils/routes.dart';
import 'package:vip1/viewModels/base_model.dart';
import 'package:flutter/widgets.dart';


class StartUpViewModel extends BaseModel {

  Future handleStartUpLogic(BuildContext context) async {
    NavigateHelper.navigate(context, Routes.Home, withpop: false, logout: true);

  }
}
