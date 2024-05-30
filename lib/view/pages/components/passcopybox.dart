import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassCopy extends StatelessWidget {
  final generatedPass;
  const PassCopy({super.key, this.generatedPass});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 200,
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    generatedPass,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.grey,
            onTap: () {
              if (generatedPass.isNotEmpty) {
                Clipboard.setData(ClipboardData(text: generatedPass));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    dismissDirection: DismissDirection.up,
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).size.height - 150),
                    backgroundColor: Colors.green,
                    content: Text('Password copied to clipboard')));
              }
            },
            child: Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.copy)),
          ),
        ],
      ),
    );
  }
}
