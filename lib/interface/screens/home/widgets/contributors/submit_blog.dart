import 'package:flutter/material.dart';

import './contribute_modal.dart';

class SubmitBlog extends StatelessWidget {
  const SubmitBlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) => const ContributeModal(),
        );
      },
      child: const Text(
        'Submit blog',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20)),
    );
  }
}
