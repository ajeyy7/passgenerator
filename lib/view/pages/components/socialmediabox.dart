import 'package:flutter/material.dart';

class SocialMediaBox extends StatelessWidget {
 final void Function()? onTap;
  final String? imageurl;
  const SocialMediaBox({super.key, this.imageurl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(imageurl!),
          ),
        ));
  }
}
