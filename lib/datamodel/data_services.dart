import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:smartmeterapp/datamodel/electricval.dart';

const String USER_TOKEN = 'posts';

class DataServices {
  final _firestore = FirebaseFirestore.instance;
  late final CollectionReference _meterRef;

  DataServices() {
    _meterRef = _firestore.collection(USER_TOKEN).withConverter<MeterData>(
        fromFirestore: (snapshot, _) => MeterData.formJson(snapshot.data()!),
        toFirestore: (meterdata, _) => meterdata.toJson());
  }

  Stream<QuerySnapshot> getRef() {
    return _meterRef.snapshots();
  }
}
