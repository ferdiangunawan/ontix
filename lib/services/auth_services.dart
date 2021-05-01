part of "services.dart";

//pada class authservice terdapat method sign up dan sign in
class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedlanguage) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email,
              password: password); // UserCredential adalah pengganti AuthResult
      //convert ke Users dari extension
      Users users = userCredential.user.convertToUsers(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedlanguage);
      await UserServices.updateUser(users);
      return SignInSignUpResult(
          users: users); //setelah di cek, akan mengembalikan  user
    } catch (e) {
      return SignInSignUpResult(
          message: e
              .toString()
              .substring(30)
              .trim()); //jika null maka akan menampilkan error message
    }
  }

  //method signin. dapet data dari firestore dan di convert ke users dari extension
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Users users = await userCredential.user.fromFirestore();

      return SignInSignUpResult(users: users);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().substring(30).trim());
    }
  }

//method signout
  static Future<void> signOut() async {
    _auth.signOut();
  }
  //method reset password
  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

//untuk memberutahu  ketika sign in sign out state, terhubung dengan maindart
  static Stream<User> get userStream => _auth.authStateChanges();
}

//untuk check user null atau ga
class SignInSignUpResult {
  Users users;
  final String message;
  SignInSignUpResult({this.users, this.message});
}
