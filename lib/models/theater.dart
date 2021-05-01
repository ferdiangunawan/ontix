part of 'models.dart';

class Theater extends Equatable {
  final String name;
  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("Bes Cinema"),
  Theater("Sungailiat Cinema"),
  Theater("Bangka Cinema"),
  Theater("Pangkal Cinema")
];
