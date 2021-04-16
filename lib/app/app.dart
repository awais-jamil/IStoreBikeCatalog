import 'package:istores_bike_catalog/services/home/home_service.dart';
import 'package:istores_bike_catalog/ui/views/detail/detail_view.dart';
import 'package:istores_bike_catalog/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: DetailView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeService),
  ]
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}