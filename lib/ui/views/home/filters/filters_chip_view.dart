import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'filter_viewmodel.dart';

class FilterChipView extends StatelessWidget {
  final Map<String, dynamic> filters;

  const FilterChipView({Key key, this.filters}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersViewModel>.reactive(
        builder: (context, viewModel, child) => Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: viewModel.filterChips(),
            ),
          ),
        ),
        viewModelBuilder: () => FiltersViewModel());
  }
}
