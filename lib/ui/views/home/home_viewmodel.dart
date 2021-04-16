import 'package:istores_bike_catalog/app/app.locator.dart';
import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends ReactiveViewModel {
  final _homeService = locator<HomeService>();
  HomeService get homeService => _homeService;

  bool get filterApplied => _homeService.filterApplied();

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_homeService];
}