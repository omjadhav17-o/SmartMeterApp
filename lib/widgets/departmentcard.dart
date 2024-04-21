import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartmeterapp/datamodel/department.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard(
      {super.key, required this.department, required this.onSelect});

  final Department department;
  //find about function
  final void Function() onSelect;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onSelect,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(100, 189, 195, 199),
            Color.fromARGB(100, 44, 62, 80),
          ], begin: Alignment.topRight, end: Alignment.topLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              department.name,
              style: const TextStyle(color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
