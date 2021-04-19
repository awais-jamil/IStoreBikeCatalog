import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/services/api/api.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class HomeService with ReactiveServiceMixin {
  HomeService() {
    listenToReactiveValues([_bikes, sortedASC]);
  }

  RxList<Bike> _bikes = RxList<Bike>();
  RxList<Bike> _dummmybikes = RxList<Bike>();
  List<Bike> get bikes => _bikes.toList();

  RxValue<Bike> _selectedBike = RxValue<Bike>(null);
  Bike get selectedBike => _selectedBike.value;
  void setSelectedBike(Bike value) => _selectedBike.value = value;

  RxList<String> _categories = RxList<String>();
  List<String> get categories => _categories.toList();

  RxList<String> _frameSizes = RxList<String>();
  List<String> get frameSizes => _frameSizes.toList();

  RxValue<bool> _sortedASC = RxValue<bool>(true);
  bool get sortedASC => _sortedASC.value;
  void setSortedASC(bool value) => _sortedASC.value = value;

  Map<String, dynamic> _filters = {
    'category': '',
    'frameSize': '',
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
  void setIsApplyingFilters(bool val) {
    _applyingFilters = val;
    filterTheData();
  }

  Future<void> applyFilters(Map<String, dynamic> f) async {
    await Future.delayed(Duration(seconds: 1), () {
      _filters = f;
      notifyListeners();
    });
  }

  void clearFilters() {
    _filters = {
      'category': '',
      'frameSize': '',
    };
    notifyListeners();
  }

  void updateFilter(String key, dynamic value) {
    _filters[key] = value;
    filterTheData();
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
      _dummmybikes = RxList<Bike>.from(tempBikes.toList());
    }
  }

  Future<void> getCategories() async {
    var api = locator<Api>();
    var response = await api.getCategories();

    if (response['status']) {
      var categoryJson = response['response']['data'];
      var tempData = <String>[];
      for (var category in categoryJson) {
        tempData.add(category);
      }
      _categories = RxList<String>.from(tempData.toList());
    } else {
      _categories = _categories ?? <String>[];
    }
  }

  Future<void> getFrameSizes() async {
    var api = locator<Api>();
    var response = await api.getFrameSizes();

    if (response['status']) {
      var frameSizeJson = response['response']['data'];
      var tempData = <String>[];
      for (var frameSize in frameSizeJson) {
        tempData.add(frameSize);
      }
      _frameSizes = RxList<String>.from(tempData.toList());
    } else {
      _frameSizes = _frameSizes ?? <String>[];
    }
  }

  void filterTheData() async {
    if(filterApplied()){
      var tempData = <Bike>[];
      for (var item in _bikes) {
        if (item.category == _filters['category'])
          tempData.add(item);
        else if(item.frameSize == _filters['frameSize'])
          tempData.add(item);
      }
      _bikes = RxList<Bike>.from(tempData.toList());
    } else {
      _bikes = _dummmybikes;
    }
  }

  void sortByPrice(){
    setSortedASC(!_sortedASC.value);

    if(_sortedASC.value){
      _bikes.sort((a, b) => a.price.compareTo(b.price));
    } else {
      _bikes.sort((a, b) => b.price.compareTo(a.price));
    }

    notifyListeners();
  }

}