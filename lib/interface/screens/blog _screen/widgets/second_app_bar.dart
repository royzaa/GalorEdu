import 'package:flutter/material.dart';

import '../../home/widgets/contributors/submit_blog.dart';

class SecondAppBar extends StatelessWidget {
  const SecondAppBar({Key? key, required this.constraints}) : super(key: key);
  final Size constraints;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: constraints.width * 1 / 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 16,
                ),
                Text(
                  'Back to home',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          const SubmitBlog(),
        ],
      ),
    );
  }
}
