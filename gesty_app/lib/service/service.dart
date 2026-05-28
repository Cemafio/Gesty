import 'dart:convert';
import 'package:http/http.dart' as http;


Future<String> register(String baseUrl, String name, String email, String pass) async {
  final url = Uri.parse('$baseUrl/auth/register');

  final request = await http.post(
    url,
    body: {
      'name': name,
      'email': email,
      'password': pass
    },
  );

  final data = jsonDecode(request.body);
  if(request.statusCode == 201){
    print("Register Success, data: $data");
    return "Success";
  }else{
    print("Register Error , data: $data");
    return "Failed";
  }
}