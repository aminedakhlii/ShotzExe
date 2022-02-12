import 'package:http/http.dart' as http;

class Api {
  Future request(username,amount) async {
    String url = 'http://206.81.12.15:1221/report/?user_id=' + username + '&amount=' + amount.toString();
    http.Response res = await http.get(Uri.parse(url));
    return res.body;
  }
}