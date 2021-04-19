import 'dart:convert';

import 'package:istores_bike_catalog/app/theme/app_icons.dart';
import 'package:istores_bike_catalog/services/api/api.dart';
import 'package:http/http.dart' as http;

class FakeApi extends Api {
  @override
  Future<Map> getBikes() async {
    var bikesData = jsonEncode({
      'data': [
        {
          'id': 1,
          'name': 'A Mountian Bike',
          'images': <String>[
            AppIcons.a_mbike,
            AppIcons.b_mbike,
          ],
          'category': 'Mountain Bike',
          'frameSize': 'Medium',
          'price': 70
        },
        {
          'id': 2,
          'name': 'A City Bike',
          'images': <String>[
            AppIcons.b_city_bike,
            AppIcons.c_city_bike,
          ],
          'category': 'City Bike',
          'frameSize': 'Small',
          'price': 100
        },
        {
          'id': 3,
          'name': 'B City Bike',
          'images': <String>[
            AppIcons.d_city_bike,
            AppIcons.c_city_bike,
          ],
          'category': 'E-Bike',
          'frameSize': 'Large',
          'price': 330
        },
        {
          'id': 4,
          'name': 'A Electric Bike',
          'images': <String>[
            AppIcons.b_ebike,
            AppIcons.d_ebike,
          ],
          'category': 'E-Bike',
          'frameSize': 'Small',
          'price': 190
        },
        {
          'id': 5,
          'name': 'B Electric Bike',
          'images': <String>[
            AppIcons.a_ebike,
            AppIcons.c_ebike,
          ],
          'category': 'City Bike',
          'frameSize': 'Medium',
          'price': 110
        },
        {
          'id': 6,
          'name': 'B Mountian Bike',
          'images': <String>[
            AppIcons.c_mbike,
            AppIcons.d_mbike,
          ],
          'category': 'Mountain Bike',
          'frameSize': 'Small',
          'price': 150
        },
        {
          'id': 7,
          'name': 'C Mountian Bike',
          'images': <String>[
            AppIcons.mbike_one,
            AppIcons.mbike_two,
          ],
          'category': 'Mountain Bike',
          'frameSize': 'Large',
          'price': 210
        },
        {
          'id': 8,
          'name': 'A City Bike',
          'images': <String>[
            AppIcons.cityBike_one,
            AppIcons.cityBike_two,
          ],
          'category': 'City Bike',
          'frameSize': 'Medium',
          'price': 500
        },
        {
          'id': 9,
          'name': 'C Electric Bike',
          'images': <String>[
            AppIcons.ebike_one,
            AppIcons.ebike_two,
            AppIcons.ebike_three,
            AppIcons.ebike_four,
          ],
          'category': 'E-Bike',
          'frameSize': 'Large',
          'price': 700
        },
      ]
    });
    var response;
    await Future.delayed(Duration(seconds: 2));
    response = http.Response('{"status": true, "response": $bikesData}', 200);
    response = json.decode(response.body);
    return response;
  }

  @override
  Future<Map> getCategories() async {
    var bikesData = jsonEncode({
      'data': [
        'Mountain Bike',
        'City Bike',
        'E-Bike'
      ]
    });
    var response;
    await Future.delayed(Duration(seconds: 0));
    response = http.Response('{"status": true, "response": $bikesData}', 200);
    response = json.decode(response.body);
    return response;
  }

  @override
  Future<Map> getFrameSizes() async {
    var bikesData = jsonEncode({
      'data': [
        'Small',
        'Medium',
        'Large'
      ]
    });
    var response;
    await Future.delayed(Duration(seconds: 0));
    response = http.Response('{"status": true, "response": $bikesData}', 200);
    response = json.decode(response.body);
    return response;
  }

}