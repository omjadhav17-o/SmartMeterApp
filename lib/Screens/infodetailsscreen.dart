import 'package:flutter/material.dart';
import 'package:smartmeterapp/datamodel/data_services.dart';
import 'package:smartmeterapp/datamodel/electricval.dart';

class InfoDetailsScreen extends StatefulWidget {
  const InfoDetailsScreen({super.key, required this.tittle});
  final String tittle;
  @override
  State<StatefulWidget> createState() {
    return _InfoDetailsScreen();
  }
}

class _InfoDetailsScreen extends State<InfoDetailsScreen> {
  final DataServices _dataServices = DataServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tittle),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BasicUI(),
    );
  }

  Widget BasicUI() {
    return SafeArea(
        child: Column(
      children: [
        _messagewidget(),
      ],
    ));
  }

  Widget _messagewidget() {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.80,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
        stream: _dataServices.getRef(),
        builder: (context, snapshot) {
          List metervals = snapshot.data?.docs ?? [];
          if (metervals.isEmpty) {
            return const Center(
              child: Text('No data to display'),
            );
          }
          return ListView.builder(
              itemCount: metervals.length,
              itemBuilder: ((context, index) {
                MeterData meterData = metervals[index].data();
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: ListTile(
                    title: Text(meterData.datae),
                    tileColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                );
              }));
        },
      ),
    );
  }
}
