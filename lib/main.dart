import 'package:flutter/material.dart';
import 'package:objectbox_test/home_object_box.dart';

void main() {
  runApp(const ObjectBoxExample());
}

class ObjectBoxExample extends StatelessWidget {
  const ObjectBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestObjectBoxHome(),
    );
  }
}
