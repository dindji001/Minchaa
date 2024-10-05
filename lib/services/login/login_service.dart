import 'dart:convert';
import 'dart:developer';

import 'package:mincha/services/api/endpoints.dart';
import 'package:mincha/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  final String baseUrl;
  LoginService() : baseUrl = Config.apiUrl;

  Future<Map<String, dynamic>> login(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl${Endpoints.loginUser}'),
      body: jsonEncode({
        'userPhoneOrEmail': email,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }else{
        final responseData = jsonDecode(response.body);
      // Récupérer un message spécifique depuis la réponse, si présent
      final errorMessage = responseData['message'] ?? 'Une erreur est survenue';
      throw Exception(errorMessage);
    
    }
  }


  Future<Map<String, dynamic>> verifyOtpLogin({
     required String CodeOTP,
  }) async {
    // Récupérer le token depuis SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenLoginExpire');
    final response = await http.post(
      Uri.parse('$baseUrl${Endpoints.valideCustomer}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer $token', // Ajouter le token à l'en-tête de la requête
      },
      body: jsonEncode(
        {
          'CodeOTP': CodeOTP, // Le code OTP à valider
        },
      ),
    );
    if (response.statusCode == 200) {
      inspect(response.body);
      print('#######################################################S');
      return jsonDecode(response.body);
    } else {   final responseData = jsonDecode(response.body);
      // Récupérer un message spécifique depuis la réponse, si présent
      final errorMessage = responseData['message'] ?? 'Une erreur est survenue';
      throw Exception(errorMessage);

    }
  }
}
