import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user.dart';
import '../model/api_response.dart';

/* WEBSERVICES
   * livrowebservices.com.br/rest/carros
   * https://carros-springboot.herokuapp.com/api/v2/login
   * http://carros-springboot.herokuapp.com/api/v1/carros/tipo/esportivos
   *
*/

class LoginModel {
  static Future<ApiResponse<User>> login(String user, String password) async {
    try{
      var url = 'http://carros-springboot.herokuapp.com/api/v2/login';

      Map<String, String> headers = {'Content-Type': 'application/json'};

      Map params = {
        'username': user,
        'password': password,
      };

      //Covertendo a lista de parametros (params) para o formato json
      String convertMap = json.encode(params);
      print('> $convertMap');

      var response = await http.post(url, body: convertMap, headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final users = User.fromJson(mapResponse);
        return ApiResponse.ok(users);
      }
      return ApiResponse.error(mapResponse['error']);
    } catch(error, exception){
      print('Erro login $error >>> $exception');
      return ApiResponse.error('Não foi possível fazer o login');
    }
  }
}
