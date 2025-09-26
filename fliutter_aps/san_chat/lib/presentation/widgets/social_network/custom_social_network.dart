import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialNetwork extends StatelessWidget {
  const CustomSocialNetwork({
    super.key,
    required this.actionFacebook,
    required this.actionGoogle,
    required this.actionApple,
    this.isLightScreen = false,
  });
  final VoidCallback actionFacebook;
  final VoidCallback actionGoogle;
  final VoidCallback actionApple;
  final bool isLightScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: actionFacebook,
          child: SvgPicture.asset(
            "assets/svg/${isLightScreen ? 'iconFacebookBlack' : 'iconFacebook'}.svg",
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: actionGoogle,
          child: SvgPicture.asset(
            "assets/svg/${isLightScreen ? 'iconGoogleBlack' : 'iconGoogle'}.svg",
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: actionApple,
          child: SvgPicture.asset(
            "assets/svg/${isLightScreen ? 'iconAppleBlack' : 'iconApple'}.svg",
          ),
        ),
      ],
    );
  }
}
