import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import './secret_key.dart';

class EmailApi {
  static sendEmail(
      {required String name,
      required String email,
      required String subject,
      required BuildContext context,
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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text("Email have been sent"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          ),
        );
      } else {
        print("sent failed: ${response.statusCode}");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text("sent failed: ${response.statusCode}"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Ok'))
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
