abstract class Api {

  Future<Map> getBikes();

  Future<Map> getFilteredBikes(Map<String, dynamic> params);
}
