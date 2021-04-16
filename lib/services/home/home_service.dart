import 'package:stacked/stacked.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class HomeService with ReactiveServiceMixin {
  PlannerService() {
    listenToReactiveValues([]);
  }

  Map<String, dynamic> _filters = {
    // 'taskType': <TaskType>[],
    // 'status': <TaskStatus>[],
    // 'users': <Admin>[],
    // 'clients': <Client>[],
    // 'date': <DatePeriod>[],
    // 'teams': <Team>[],
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
      // 'taskType': <TaskType>[],
      // 'status': <TaskStatus>[],
      // 'users': <Admin>[],
      // 'clients': <Client>[],
      // 'date': <DatePeriod>[],
      // 'teams': <Team>[],
    };
    notifyListeners();
  }

  void updateFilter(String key, dynamic value) {
    _filters[key] = value;
    notifyListeners();
  }
}