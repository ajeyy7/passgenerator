import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor;
  final String name;
  final Function() onPressed;
  const CommonButton({
    super.key,
    required this.name,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              minimumSize: const Size(300, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          )),
    );
  }
}
