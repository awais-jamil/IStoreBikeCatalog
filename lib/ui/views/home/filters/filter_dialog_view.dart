import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/ui/widgets/searchable_drop_down.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:stacked/stacked.dart';
import 'filter_viewmodel.dart';

class FilterDialogView extends StatefulWidget {
  FilterDialogView({
    Key key,
    this.vm,
    this.filters,
  }) : super(key: key);
  final FiltersViewModel vm;
  final Map filters;

  @override
  _FilterDialogViewState createState() => _FilterDialogViewState();
}

class _FilterDialogViewState extends State<FilterDialogView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FiltersViewModel>.reactive(
      builder: (context, viewModel, child) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Card(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            headingTextWidget(
                              text: 'Filters',
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                viewModel.clearFilters();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        SearchableDropDown(
                          dropDownItems: viewModel.categoryDropDown,
                          hintText: 'Category',
                          searchHint: null,
                          selectedValueWidgetFn: (item) {
                            if (viewModel.filters['category'] != null &&
                                viewModel.filters['category'].isNotEmpty) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children:
                                  viewModel.filterChipsForKey('category'),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          onChanged: (value) => viewModel.selectedObjects(
                            value,
                            'category',
                            notify: false,
                          ),
                          searchFn: (String keyword, items) {
                            var ret = <int>[];
                            if (keyword != null &&
                                items != null &&
                                keyword.isNotEmpty) {
                              keyword.split(' ').forEach((k) {
                                var i = 0;
                                items.forEach((item) {
                                  if (k.isNotEmpty &&
                                      (item.value
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                          k.toLowerCase()) ||
                                          item.value
                                              .toString()
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                              k.toLowerCase()))) {
                                    ret.add(i);
                                  }
                                  i++;
                                });
                              });
                            }
                            if (keyword.isEmpty) {
                              ret = Iterable<int>.generate(items.length)
                                  .toList();
                            }
                            return (ret);
                          },
                        ),

                        SearchableDropDown(
                          dropDownItems: viewModel.frameSizeDropDown,
                          hintText: 'frameSize',
                          searchHint: null,
                          selectedValueWidgetFn: (item) {
                            if (viewModel.filters['frameSize'] != null &&
                                viewModel.filters['frameSize'].isNotEmpty) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  children:
                                  viewModel.filterChipsForKey('frameSize'),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                          onChanged: (value) => viewModel.selectedObjects(
                            value,
                            'frameSize',
                            notify: false,
                          ),
                          searchFn: (String keyword, items) {
                            var ret = <int>[];
                            if (keyword != null &&
                                items != null &&
                                keyword.isNotEmpty) {
                              keyword.split(' ').forEach((k) {
                                var i = 0;
                                items.forEach((item) {
                                  if (k.isNotEmpty &&
                                      (item.value
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                          k.toLowerCase()) ||
                                          item.value
                                              .toString()
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                              k.toLowerCase()))) {
                                    ret.add(i);
                                  }
                                  i++;
                                });
                              });
                            }
                            if (keyword.isEmpty) {
                              ret = Iterable<int>.generate(items.length)
                                  .toList();
                            }
                            return (ret);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          child: titleTextWidget(text: 'Apply', textColor: Colors.white),
                          minWidth: MediaQuery.of(context).size.width,
                          color: AppColors.textPrimary,
                          onPressed: ()  => {
                            viewModel.applyFilters(widget.filters),
                            Navigator.pop(context),
                          }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => widget.vm,
      initialiseSpecialViewModelsOnce: true,
      disposeViewModel: false,
    );
  }
}
