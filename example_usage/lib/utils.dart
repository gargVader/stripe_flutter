import 'dart:convert';

import 'package:http/http.dart' as http;

class Utils {
  static Future<void> makeHTTPRequest(String endpoint, String method,
      {String body = ''}) async {
    var username =
        'sk_test_51MsM2ASHrGGmxfqDILpCv8r0VzDKPeg0g5uXauXH5UtOgFyIETJcWmjoUNCHPkd877CQiXKTLAxZArupCRcuGd8A00MScEDCAC';
    var basicAuth = 'Basic ' + base64.encode(utf8.encode('$username:'));
    var headers = {
      'authorization': basicAuth,
    };
    var request =
        http.Request(method, Uri.parse('https://api.stripe.com/$endpoint'));

    request.headers.addAll(headers);
    request.body = body;

    var response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
