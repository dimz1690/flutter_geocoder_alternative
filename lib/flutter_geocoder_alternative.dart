library flutter_geocoder_alternative;

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

/// A Calculator.
class Geocoder {
  Future<String> getAddressFromLonLat(double pLat, double pLng) async {
    String posDegree =
        '${convertLatLng(pLat, true)} ${convertLatLng(pLng, false)}';
    String gMapsUrl =
        "https://www.google.com/maps/place/$posDegree/@$pLat,$pLng,17z";

    final response = await http.Client().get(Uri.parse(gMapsUrl));

    String address = 'not found';

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var metas = document.getElementsByTagName("meta");
      for (var meta in metas) {
        bool isAdrress = false;
        var attrs = meta.attributes;
        attrs.forEach((key, value) {
          if (key == 'itemprop' && value == 'description') {
            isAdrress = true;
          }
        });
        if (isAdrress) {
          attrs.forEach((key, value) {
            if (key == 'content') {
              address = value;
            }
          });
        }
      }
    }

    return address;
  }

  String convertLatLng(double decimal, bool isLat) {
    String degreeBefore = "${decimal.toString().split(".")[0]}°";
    String degree = degreeBefore.substring(0, 1) == '-'
        ? degreeBefore.substring(1, degreeBefore.length)
        : degreeBefore;
    double minutesBeforeConversion =
        double.parse("0.${decimal.toString().split(".")[1]}");
    String minutes =
        "${(minutesBeforeConversion * 60).toString().split('.')[0]}'";
    double secondsBeforeConversion = double.parse(
        "0.${(minutesBeforeConversion * 60).toString().split('.')[1]}");
    String seconds =
        '${double.parse((secondsBeforeConversion * 60).toString()).toStringAsFixed(2)}"';
    String dmsOutput =
        "$degree$minutes$seconds${isLat ? decimal > 0 ? 'N' : 'S' : decimal > 0 ? 'E' : 'w'}";
    return dmsOutput;
  }
}
