import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:stacked/stacked.dart';

class FiltersViewModel extends BaseViewModel {

  final HomeService _homeService = locator<HomeService>();

  Map<String, dynamic> _filters;
  Map<String, dynamic> get filters {
    _filters ??= _homeService.filters;
    return _filters;
  }

  bool get isLoading => _homeService.isLoading;

  List get categoryDropDown {
    var categories = _homeService.categories;

    return categories
        .map(
          (e) => DropdownMenuItem(
        value: e,
        child: subTitleTextWidget(text: e),
      ),
    ).toList();
  }

  List get frameSizeDropDown {
    var frameSizes = _homeService.frameSizes;

    return frameSizes
        .map(
          (e) => DropdownMenuItem(
        value: e,
        child: subTitleTextWidget(text: e),
      ),
    ).toList();
  }

  void selectedObjects(String value, String filterType, {bool notify = true}) {
    updateFilter(filterType, value, true, notify: notify);
  }

  void updateFilter(String filter, dynamic value, bool selected,
      {bool notify = true}) {
    _filters[filter] = value;
    if (notify) notifyListeners();
  }

  bool filterApplied() {
    return _homeService.filterApplied();
  }

  Future<void> applyFilters(Map<String, dynamic> f) async {
    _homeService.setIsApplyingFilters(true);
    _filters = f;
    await _homeService.applyFilters(f);
  }

  void clearFilters() {
    _filters = null;
    _homeService.setIsApplyingFilters(false);
    _homeService.clearFilters();
  }

  List<Widget> filterChips() {
    var result = <Widget>[];
    filters.forEach((key, value) {
      result.addAll(filterChipsForKey(key, updatePlanner: true));
    });
    return result;
  }

  List<Widget> filterChipsForKey(String key, {bool updatePlanner = false}) {
    var result = <Widget>[];
    var value = filters[key];
    if (value.isNotEmpty) {
      // for (var data in value) {
        var chip = chipFor(key, value, updatePlanner);
        if (chip != null) {
          result.add(chip);
        }
      // }
    }
    return result;
  }

  Widget chipFor(String key, dynamic value, bool updatePlanner) {
    return (value != null)
        ? GestureDetector(
      onTap: () {
        updateFilter(key, '', true);
        if (updatePlanner) {
          _homeService.setIsApplyingFilters(true);
          _homeService.updateFilter(key, filters[key]);
        }
      },
      child: Chip(
        backgroundColor: AppColors.filterChipBackground,
        label: detailTextWidgetBold(
          text: value,
          textColor: AppColors.filterChipText,
        ),
        avatar: Icon(
          Icons.close,
          color: AppColors.filterChipText,
          size: 16.0,
        ),
      ),
    )
        : null;
  }

}