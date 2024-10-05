import 'dart:convert';
import 'dart:developer';
import 'package:mincha/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/endpoints.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  final String baseUrl;
  RegisterService() : baseUrl = Config.apiUrl;
  Future<Map<String, dynamic>> register(String name, String lastname,
      String email, String sexe, String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$baseUrl${Endpoints.registerUser}'),
      body: jsonEncode({
        'userFirstname': name,
        'userLastname': lastname,
        'userPhoneNumber': phoneNumber,
        'userEmail': email,
        'userCountry': '225',
        'userPassword': "12345",
        'userGender': sexe, // 1 pour Feminin 0 pour masculin
        'userIsActive': 0
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('##################RESPONSE 1#####################################S');
      inspect(response.body);
      print('#######################################################S');
      return jsonDecode(response.body);
    } else {
      final responseData = jsonDecode(response.body);
      // Récupérer un message spécifique depuis la réponse, si présent
      final errorMessage = responseData['message'] ?? 'Une erreur est survenue';
      throw Exception(errorMessage);
    }
  }

  Future<Map<String, dynamic>> verifyOtpRegister(
      String otpLogin,
  ) async {
    // Récupérer le token depuis SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenExpire');
    final response = await http.post(
      Uri.parse('$baseUrl${Endpoints.valideCustomer}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer $token', // Ajouter le token à l'en-tête de la requête
      },
      body: jsonEncode(
        {
          'CodeOTP': otpLogin, // Le code OTP à valider
        },
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {   final responseData = jsonDecode(response.body);
      // Récupérer un message spécifique depuis la réponse, si présent
      final errorMessage = responseData['message'] ?? 'Une erreur est survenue';
      throw Exception(errorMessage);

    }
  }

  Future<Map<String, dynamic>> resentCustomerOtpRegister(
      String email,
  ) async {
    // Récupérer le token depuis SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('tokenExpire');
    final response = await http.post(
      Uri.parse('$baseUrl${Endpoints.resentOtp}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          'userEmail': email, // Le code OTP à valider
        },
      ),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {   final responseData = jsonDecode(response.body);
      // Récupérer un message spécifique depuis la réponse, si présent
      final errorMessage = responseData['message'] ?? 'Une erreur est survenue';
      throw Exception(errorMessage);

    }
  }
}
