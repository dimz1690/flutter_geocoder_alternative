# flutter_geocoder_alternative
flutter package to convert latitude/longitude to address.

## Using
The first import package:

```dart
import 'package:flutter_geocoder_alternative/flutter_geocoder_alternative.dart';
```

Init geocoder class:
```dart
Geocoder geocoder = Geocoder();
```

Then create function for call the address:
```dart
Future<String> getAddress(double pLon, double pLat) {
  return geocoder.getAddressFromLonLat(pLon, pLat);
}
```

Call the function for get the address:
```dart
Future<void> _showAddress() async {
  _address = await getAddress(-6.1805312, 106.8282181);
}
```



