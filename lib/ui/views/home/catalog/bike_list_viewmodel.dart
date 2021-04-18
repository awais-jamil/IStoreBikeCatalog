import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BikeListViewModel extends FutureViewModel{

  final _homeService = locator<HomeService>();
  HomeService get homeService => _homeService;

  List<Bike> get bikes => _homeService.bikes;

  @override
  Future futureToRun() => fetchData();

  Future<void> fetchData() async {
    setBusy(true);
    await _homeService.getAllBikes();
    await _homeService.getCategories();
    await _homeService.getFrameSizes();
    setBusy(false);
  }

  void updateSelectedBike(int index){
    homeService.setSelectedBike(bikes[index]);
  }

  void navigateTo(String path){
    var navigationService = locator<NavigationService>();
    navigationService.navigateTo(path);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_homeService];

}