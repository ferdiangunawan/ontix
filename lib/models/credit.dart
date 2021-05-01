part of 'models.dart';

class Credit extends Equatable {
  final String name;
  final String profilPath;

  Credit({this.name, this.profilPath});
  @override
  List<Object> get props => [name, profilPath];
}
