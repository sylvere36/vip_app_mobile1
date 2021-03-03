
import 'package:vip1/utils/UIData.dart';
import 'package:vip1/viewModels/startupView_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModelBuilder: () => StartUpViewModel(),
      disposeViewModel: false,
      onModelReady: (model) => model.handleStartUpLogic(context),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
              color: ColorsData.colorsPrimary,
            )),
      ),
    );
  }
}
