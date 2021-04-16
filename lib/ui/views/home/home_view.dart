import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: AppColors.background,
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                ) : SafeArea(
                    child: child
                ),
      ),
      viewModelBuilder: () => HomeViewModel(),);
  }
}
