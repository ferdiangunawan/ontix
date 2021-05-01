part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection = FirebaseFirestore.instance
      .collection('users'); //firestore direvisi menjadi FirebaseFirestore

  //untuk memasukan data ke ke Firestore
  static Future<void> updateUser(Users users) async {
    _userCollection.doc(users.id).set({
      'email': users.email,
      'name': users.name,
      'balance': users.balance,
      'selectedGenres': users.selectedGenres,
      'selectedLanguage': users.selectedLanguage,
      'profilePicture': users.profilePicture ??
          "" // profilepicture kalo ga null, kalau null dia kosong ""
    });
  }

//mendapatkan data dari firestore
//snapshot.data()['xx'] bisa juga menjadi snapshot.get('parameter di database')
  static Future<Users> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    return Users(id, snapshot.get('email'),
        balance: snapshot.get('balance'),
        profilePicture: snapshot.get('profilePicture'),
        selectedGenres: (snapshot.get('selectedGenres') as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.get('selectedLanguage'),
        name: snapshot.get('name'));
  }
}
