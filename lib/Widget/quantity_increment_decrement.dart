import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class QuantityIncrementDecrement extends StatelessWidget {
  final int CurrentNumber;
  final Function() onAdd;
  final Function() onRemov;
  const QuantityIncrementDecrement({
    super.key,
    required this.CurrentNumber,
    required this.onAdd,
    required this.onRemov,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2.5, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onRemov, icon: Icon(Iconsax.minus)),
          SizedBox(width: 10),
          Text(
            "$CurrentNumber",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          IconButton(onPressed: onAdd, icon: Icon(Iconsax.add)),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
