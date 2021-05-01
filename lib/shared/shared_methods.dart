//image picker tipe file new version
part of 'shared.dart';

Future<File> getImage() async {
  final picker = ImagePicker();

  PickedFile image = await picker.getImage(source: ImageSource.gallery);
  final File file = File(image.path); //transform PickedFile to File format
  return file;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);
  firebase_storage.Reference ref =
      FirebaseStorage.instance.ref().child(fileName);
  firebase_storage.UploadTask task = ref.putFile(image);

  return (await task).ref.getDownloadURL();
}