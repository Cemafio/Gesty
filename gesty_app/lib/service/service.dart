import 'dart:convert';
import 'dart:math';
import 'package:gesty_app/models/category_model.dart';
import 'package:gesty_app/models/money_box_model.dart';
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
  print(token);
  try {
    final url = Uri.parse('$baseUrl/wallets/one/$typeWallet');
    final request = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      }
    );

    // Body vide
    if (request.body.isEmpty) return {};

    final data = jsonDecode(request.body);

    // data peut être null ou pas un Map
    if (data == null || data is! Map<String, dynamic>) return {};

    if (request.statusCode == 200 || request.statusCode == 201) {
      print("Get wallet amount Success");
      return data;
    } else {
      print("Wallet Error: $data");
      return data;
    }

  } catch (e) {
    print("getWallet Exception: $e");
    return {};
  }
}

Future<void> creatWallet(String baseUrl, String typeWallet, String nameWallet) async {
  try {
    final url = Uri.parse('$baseUrl/wallets/create');
    final request = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "name": nameWallet,
        "type": typeWallet,
      })
    );

    final data = jsonDecode(request.body);

    if (request.statusCode == 200 || request.statusCode == 201) {
      print("Create wallet Success");
      // return data;
    } else {
      print("Wallet Error: $data");
      // return data;
    }

  } catch (e) {
    print("createWallet Exception: $e");
    // return {};
  }
}

// TRANSACTIONS
Future<void> depositServiceTransaction({
  required int idWallet,
  required String token,
  required String baseUrl,
  required String type,
  required double amount,
  required String category,
  required String description,
  required String categoryName,
}) async {
  final url = Uri.parse('$baseUrl/transactions/create');

  final response = await http.post(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "amount": amount,
      "type": type,
      "description": description,
      "walletId": idWallet,
      "categoryName": categoryName,
    }),
  );

  if (response.statusCode == 201) {
    print('Transaction created');
  } else {
    throw Exception(
      'Error to create this transaction: ${response.body}',
    );
  }
}

Future<List<TransactionModel>> getAllTransactions(String baseUrl, String token) async {
  final url = Uri.parse('$baseUrl/transactions/all');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final List<TransactionModel> data = (jsonDecode(response.body) as List)
      .map(
        (e) {
          return TransactionModel.fromJson(e);
        },
      )
      .toList();
    print('Transactions retrieved successfully, ${data.runtimeType}');

    return data;
  } else {
    throw Exception(
      'Error to retrieve transactions: ${response.body}',
    );
  }
}
// CATEGORY
Future<List<CategoryModel>> getAllCategory({
  required String baseUrl,
  required String token,
  required int walletId
}) async {
  final url = Uri.parse('$baseUrl/categories/all');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    print('Categories retrieved successfully' );
    final data = (jsonDecode(response.body) as List).map((c)=> CategoryModel.fromJson(c)).toList();
    return data;
  } else {
    throw Exception(
      'Error to retrieve categories: ${response.body}',
    );
  }
}
// MONEY BOX

Future<Map<String, dynamic>> createMoneyBox({
  required String baseUrl,
  required String token,
  required String name,
  required double targetAmount,
}) async {
  try {
    final url = Uri.parse('$baseUrl/money-box/create');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'targetAmount': targetAmount,
        'amountInBox': 0,
      }),
    );

    if (response.body.isEmpty) return {};
    final data = jsonDecode(response.body);
    if (data == null || data is! Map<String, dynamic>) return {};

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('MoneyBox created!');
      return data;
    } else {
      print('MoneyBox error: $data');
      return data;
    }
  } catch (e) {
    print('createMoneyBox exception: $e');
    return {};
  }
}

Future<List<MoneyBoxModel>> getMoneyBox(String baseUrl, String token) async {
  final url = Uri.parse('$baseUrl/money-box/all');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer $token',
    }
  );
  
  if(response.statusCode == 200) {
    final List<MoneyBoxModel> data = (jsonDecode(response.body) as List)
      .map(
        (e) {
          return MoneyBoxModel.fromJson(e);
        },
      )
      .toList();
    print('Money boxes retrieved successfully, ${data.runtimeType}');

    return data;
  } else {
    throw Exception(
      'Error to retrieve money boxes: ${response.body}',
    );
  }
}
Future<void> updateMoneyBoxAPI({required String baseUrl, required String token, required double amountInBox, required int id}) async {
  print('Amount in service to update: $amountInBox');

  final url = Uri.parse('$baseUrl/money-box/update/$id');

  final response = await http.put(
    url,
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    },
    body: jsonEncode({
      "amountInBox": amountInBox
    }),
  );

  if(response.statusCode == 200) {
    print('Money box updated successfully');
  } else {
    throw Exception(
      'Error to update money box: ${response.body}',
    );
  }
}