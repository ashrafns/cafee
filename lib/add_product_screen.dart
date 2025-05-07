import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

// final databaseReference = FirebaseDatabase.instance.ref("App_Category");
final databaseReference = FirebaseDatabase.instance.ref("App_Category");

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(children: [

      ],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return myDialogBtn(
                context: context,
                category: "",
                title: "Create Item",
                desc: "Add",
                price: "0",
                onPressed: () {
                  final id = DateTime.now().microsecondsSinceEpoch.toString();
                  databaseReference.child(id).set({
                    'category': categoryController.text.toString(),
                    "title": titleController.text.toString(),
                    "descripition": descController.text.toString(),
                    "price": priceController.text.toString(),
                    "id": id,
                  });
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Dialog myDialogBtn({
    required BuildContext context,
    required String category,
    required String title,
    required String desc,
    required String price,
    required VoidCallback onPressed,
  }) {
    return Dialog(
      backgroundColor: Colors.blue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                CircleAvatar(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                  ),
                ),
              ],
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: "Enter the Category",
                hintText: "eg . jone",
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Enter the Title",
                hintText: "eg . job",
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: "Enter the descripition",
                hintText: "eg . desciripition",
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: "Enter the price",
                hintText: "eg . price",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: onPressed, child: Text(title)),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
