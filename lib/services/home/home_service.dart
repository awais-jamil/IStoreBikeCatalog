import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/services/api/api.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class HomeService with ReactiveServiceMixin {
  HomeService() {
    listenToReactiveValues([_bikes]);
  }

  RxList<Bike> _bikes = RxList<Bike>();
  List<Bike> get bikes => _bikes.toList();

  Map<String, dynamic> _filters = {
  };

  Map<String, dynamic> get filters => _filters;

  bool filterApplied() {
    var result = false;
    filters.forEach((key, value) {
      result = (result || value.isNotEmpty);
    });
    return result;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool val) => _isLoading = val;

  bool _applyingFilters = false;
  bool get isApplyingFilters => _applyingFilters;
  void setIsApplyingFilters(bool val) => _applyingFilters = val;

  Future<void> applyFilters(Map<String, dynamic> f) async {
    await Future.delayed(Duration(seconds: 1), () {
      _filters = f;
      notifyListeners();
    });
  }

  void clearFilters() {
    _filters = {
    };
    notifyListeners();
  }

  void updateFilter(String key, dynamic value) {
    _filters[key] = value;
    notifyListeners();
  }

  Future<void> getAllBikes() async {
    var api = locator<Api>();
    var response = await api.getBikes();

    if (response['status']) {
      var bikesJson = response['response']['data'];
      var tempBikes = <Bike>[];
      for (var bike in bikesJson) {
        tempBikes.add(Bike.fromJson(bike));
      }
      _bikes = RxList<Bike>.from(tempBikes.toList());
    }
  }

}