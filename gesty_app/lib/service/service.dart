import 'dart:convert';
import 'package:gesty_app/models/transaction_model.dart';
import 'package:http/http.dart' as http;

// AUTHENTIFICATION

Future<Map<String, dynamic>> register(String baseUrl, String name, String email, String pass) async {
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
    return {"success":true};
  }else{
    print("Register Error , data: $data");
    return {"success": false, 'mess':data['message']};
  }
}

Future<Map<String, dynamic>> login(String baseUrl, String email, String pass) async {
  final url = Uri.parse('$baseUrl/auth/login');

  final request = await http.post(
    url,
    body: {
      'email': email,
      'password': pass
    },
  );

  final data = jsonDecode(request.body);
  if(request.statusCode == 200 || request.statusCode == 201){
    print("Login Success, token: ${data['accessToken']}");
    return {
      "success": true,
      "token": data['accessToken'],
      "user_data": data['user']
    };
  }else{
    print("Login Error , data: $data");
    return {"success": false, 'mess':data['message']};
  }
}
// WALLET
Future<Map<String, dynamic>> getWallet(String baseUrl, String typeWallet, String token) async {
  final url = Uri.parse('$baseUrl/wallets/one/$typeWallet');

  final request = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    }
  );

  final data = jsonDecode(request.body);
  if(request.statusCode == 200 || request.statusCode == 201){
    print("Get wallet amount Success, data: ${data}");
    return data;
  }else{
    print("Login Error , data: $data");
    return data;
  }
}
// TRANSACTIONS
Future<void> depositServiceTransaction({
  required int idWallet,
  required String token,
  required String baseUrl,
  required TransactionType type,
  required double amount,
  required String category,
}) async {

  final url = Uri.parse('$baseUrl/transactions/create');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'amount': amount,
      'type': type,
      'description': 'Deposit',
      'walletId': idWallet,
      'categoryId': category,
    }),
  );

  if (response.statusCode == 200) {
    print('Transaction created');
  } else {
    throw Exception(
      'Erreur update : ${response.body}',
    );
  }
}