import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:stacked/stacked.dart';

class BikeListViewModel extends FutureViewModel{

  final _homeService = locator<HomeService>();
  HomeService get homeService => _homeService;

  List<Bike> bikes = [];

  @override
  Future futureToRun() => fetchData();

  Future<void> fetchData() async {
    setBusy(true);
    await _homeService.getAllBikes();
    bikes = _homeService.bikes;
    setBusy(false);
  }
}