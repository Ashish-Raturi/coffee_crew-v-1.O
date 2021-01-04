import 'package:coffee_crew/models/brew.dart';
import 'package:coffee_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // create collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  //updating user data in database
  Future updateUserData(String sugar, String name, int stringth) async {
    return await brewCollection
        .doc(uid)
        .set({'sugar': sugar, 'name': name, 'stringth': stringth});
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(brewListFormSnapshot);
  }

  //Brew list form snapshot
  List<Brew> brewListFormSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.get('name'),
          sugar: doc.get('sugar'),
          strength: doc.get('stringth'));
    }).toList();
  }

  //get doc data stream
  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(userDataFormDocSnapshot);
  }

  UserData userDataFormDocSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        name: snapshot.get('name'),
        uid: uid,
        sugar: snapshot.get('sugar'),
        stringth: snapshot.get('stringth'));
  }
}
