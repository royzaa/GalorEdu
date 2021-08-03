import 'package:flutter/material.dart';

import '../../../theme/drop_shadow_theme.dart';
import '../../../theme/my_text_theme.dart';

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 48,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          DropShadowTheme.appBar,
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: size.width * 1 / 6),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            width: size.width * 2 / 3 * 1 / 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'GalorEdu',
                    style: MyTextTheme.webName,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                TextButton(
                  onPressed: () {},
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Tentang kami',
                      style: MyTextTheme.appBarMenu,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                TextButton(
                  onPressed: () {},
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Program',
                      style: MyTextTheme.appBarMenu,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            width: size.width * 2 / 3 * 1 / 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Kelurahan Purbalingga Lor',
                    style: MyTextTheme.village,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Image.asset(
                  'assets/images/logo_kab.png',
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
