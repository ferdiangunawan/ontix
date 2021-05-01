part of 'services.dart';

class OntixTransactionService {
  static CollectionReference transactionCollection =
      FirebaseFirestore.instance.collection('transactions');
//Save Transaction
  static Future<void> saveTransaction(OntixTransaction ontixTransaction) async {
    await transactionCollection.doc().set({
      'userID': ontixTransaction.userID,
      'title': ontixTransaction.title,
      'subtitle': ontixTransaction.subtitle,
      'time': ontixTransaction.time.millisecondsSinceEpoch,
      'amount': ontixTransaction.amount,
      'picture': ontixTransaction.picture
    });
  }

// Note: Get Transaction
  static Future<List<OntixTransaction>> getTransaction(String userID) async {
//ambil data dulu
    QuerySnapshot snapshot = await transactionCollection.get();
//masukan data ke model bedasarkan userID
    var documents =
        snapshot.docs.where((document) => document.get('userID') == userID);

    return documents
        .map((e) => OntixTransaction(
            userID: e.get('userID'),
            title: e.get('title'),
            subtitle: e.get('subtitle'),
            time: DateTime.fromMillisecondsSinceEpoch(e.get('time')),
            amount: e.get('amount'),
            picture: e.get('picture')))
        .toList();
  }
}
