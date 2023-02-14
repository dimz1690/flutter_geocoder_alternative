# flutter_geocoder_alternative
flutter package to convert latitude/longitude to address.

## Using
The easiest way to use this library is pass your longitude and latitude in double format, like:
```dart
import 'package:http/http.dart' as http;

var url = Uri.https('example.com', 'whatsit/create');
var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
print('Response status: ${response.statusCode}');
print('Response body: ${response.body}');

print(await http.read(Uri.https('example.com', 'foobar.txt')));
```

You can alternatively use `Geocoder.google` member for requesting distant data from google services instead of native ones.
