part of "shared.dart";

String apiKey = "9ecd8053a7b26606839504fff14f93f4";
String imageBaseUrl = "https://image.tmdb.org/t/p/";

//mencegah ke halaman 2 kali karena firebase otentifikasi tidak terkontrol.
PageEvent prevPageEvent;

//untuk di uplaod setelah confirmasi account
File imageFileToUpload;
