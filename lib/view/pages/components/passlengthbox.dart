import 'package:flutter/material.dart';

class Passlength extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;
  const Passlength({
    super.key,
    this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Password Length",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Container(
                height: 35,
                width: 80,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                    isExpanded: false,
                    items: items,
                    onChanged: onChanged))
          ],
        ),
      ),
    );
  }
}
