part of 'extensions.dart';

//User pengganti dari FirebaseUser
extension FirebaseUserExtension on User {
  Users convertToUsers(
          {String name = "no name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 5000}) =>
      Users(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: balance);

//extension untuk signIn
  Future<Users> fromFirestore() async => await UserServices.getUser(this.uid);
}