import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_icons.dart';
import 'package:stacked/stacked.dart';

import 'filter_viewmodel.dart';

class FilterButtonView extends StatefulWidget {
  @override
  _FilterButtonViewState createState() => _FilterButtonViewState();
}

class _FilterButtonViewState extends State<FilterButtonView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersViewModel>.reactive(
      builder: (context, viewModel, child) =>
      viewModel.isLoading ? Container() : getFilterIcon(context, viewModel),
      viewModelBuilder: () => FiltersViewModel(),
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
    );
  }
}

Widget getFilterIcon(BuildContext context, FiltersViewModel viewModel) {
  return MaterialButton(
    key: Key('filterIcon'),
    onPressed: () {
    },
    child: Image.asset(
      viewModel.filterApplied() ? AppIcons.filterApplied : AppIcons.filter,
    ),
  );
}
