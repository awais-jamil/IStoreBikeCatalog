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
          'name': 'Bike 1',
          'images': <String>[
            AppIcons.mbike_one,
            AppIcons.mbike_two,
          ],
          'category': 'Mountain Bike',
          'frameSize': 'Medium',
          'price': 150
        },
        {
          'id': 2,
          'name': 'Bike 2',
          'images': <String>[
            AppIcons.cityBike_one,
            AppIcons.cityBike_two,
          ],
          'category': 'City Bike',
          'frameSize': 'Small',
          'price': 100
        },
        {
          'id': 3,
          'name': 'Bike 3',
          'images': <String>[
            AppIcons.ebike_three,
            AppIcons.ebike_one,
          ],
          'category': 'E-Bike',
          'frameSize': 'Large',
          'price': 300
        },
        {
          'id': 4,
          'name': 'Bike 4',
          'images': <String>[
            AppIcons.ebike_one,
            AppIcons.ebike_two,
          ],
          'category': 'E-Bike',
          'frameSize': 'Medium',
          'price': 190
        },
        {
          'id': 5,
          'name': 'Bike 5',
          'images': <String>[
            AppIcons.cityBike_two,
            AppIcons.cityBike_one,
          ],
          'category': 'City Bike',
          'frameSize': 'Medium',
          'price': 110
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