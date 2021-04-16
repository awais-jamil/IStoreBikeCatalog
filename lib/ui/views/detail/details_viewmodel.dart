import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends ReactiveViewModel {
  final _homeService = locator<HomeService>();
  HomeService get homeService => _homeService;

  Bike get selectecBike => _homeService.selectedBike;

  void navigateBack(){
    var navigationService = locator<NavigationService>();
    navigationService.popRepeated(1);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_homeService];
}