import 'dart:convert';

import 'package:http/http.dart' as http;

import './secret_key.dart';

class EmailApi {
  static sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final url = Uri.parse(r'https://api.emailjs.com/api/v1.0/email/send');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': SecretKey.serviceMailId,
          'template_id': SecretKey.templateId,
          'user_id': SecretKey.userId,
          'template_params': {
            'user_subject': subject,
            'user_name': name,
            'user_email': email,
            'user_message': message,
          },
        }),
      );

      if (response.statusCode == 200) {
        print("email have been sent");
      } else {
        print("sent failed: ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
  }
}
