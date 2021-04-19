import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/ui/views/home/catalog/bike_list.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:stacked/stacked.dart';

import 'filters/filter_button.dart';
import 'filters/filters_chip_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 16.0),
                        child: headingTextWidget(text: 'IStore Bike Catalog'),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => {
                            model.homeService.sortByPrice(),
                          },
                          child: Row(
                            children: [
                              titleTextWidget(text: 'Price'),
                              Icon(model.sortedASC ?
                              Icons.arrow_drop_down_rounded:
                              Icons.arrow_drop_up_rounded)
                            ],
                          ),
                        ),
                        FilterButtonView(),
                      ],
                    )
                  ],
                ),
                model.filterApplied
                    ? IntrinsicHeight(
                  child: Container(
                    constraints: BoxConstraints.loose(
                      Size(
                        double.infinity,
                        50.0,
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: FilterChipView(
                      filters: model.homeService.filters,
                    ),
                  ),
                ) : Container(),
                BikeList(),
              ],
            ),
          ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
