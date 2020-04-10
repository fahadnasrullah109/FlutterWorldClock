import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:worldclockapp/models/locations_data.dart';
import 'package:worldclockapp/models/world_clock_model.dart';

class Services {

  Future<WorldClock> getTime(Location location) async {
    String url = "http://worldtimeapi.org/api/timezone/" + location.locationSubUrl;
    Response response = await get(url);
    if(response.statusCode != 200){
      return null;
    }
    dynamic result = jsonDecode(response.body);
    print(result['datetime']);
    String newDateTimeString = result['datetime'];
    newDateTimeString.substring(0, newDateTimeString.indexOf('.'));
    return WorldClock(
      dateTime: new DateFormat("yyyy-MM-ddThh:mm:ss").parse(newDateTimeString),
      timeZone: location.locationName,
      utcOffset: result['utc_offset']
    );
  }
}