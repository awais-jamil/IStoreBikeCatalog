import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_icons.dart';
import 'package:istores_bike_catalog/ui/views/home/filters/filter_dialog_view.dart';
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
    minWidth: 12,
    onPressed: () {
      return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 500),
        barrierLabel: MaterialLocalizations.of(context).dialogLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (context, _, __) => FilterDialogView(
          vm: viewModel,
          filters: viewModel.filters,
        ),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ).drive(Tween<Offset>(
              begin: Offset(0, -1.0),
              end: Offset.zero,
            )),
            child: child,
          );
        },
      );
    },
    child: Image.asset(
      viewModel.filterApplied() ? AppIcons.filterApplied : AppIcons.filter,
    ),
  );
}
