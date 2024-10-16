import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartmeterapp/Screens/infodetailsscreen.dart';
import 'package:smartmeterapp/data/departmentdata.dart';
import 'package:smartmeterapp/datamodel/department.dart';
import 'package:smartmeterapp/widgets/departmentcard.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({super.key});

  void _selectedDepartment(BuildContext context, Department department) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => InfoDetailsScreen(
          tittle: department.name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (final department in departments)
          DepartmentCard(
              department: department,
              onSelect: () {
                _selectedDepartment(context, department);
              }),
      ],
    );
  }
}
