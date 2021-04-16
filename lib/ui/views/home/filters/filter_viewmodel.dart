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
    _homeService.setIsApplyingFilters(true);
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
      for (var data in value) {
        var chip = chipFor(key, data, updatePlanner);
        if (chip != null) {
          result.add(chip);
        }
      }
    }
    return result;
  }

  Widget chipFor(String key, dynamic value, bool updatePlanner) {
    return (value != null)
        ? GestureDetector(
      onTap: () {
        var values = filters[key];
        values.remove(value);
        // updateFilter(key, values, true);
        // if (updatePlanner) {
        //   _plannerService.setIsApplyingFilters(true);
        //   _plannerService.updateFilter(key, filters[key]);
        // }
      },
      child: Chip(
        backgroundColor: AppColors.filterChipBackground,
        label: detailTextWidgetBold(
          // text: displayValueFromObject(key, value),
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