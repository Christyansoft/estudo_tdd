import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RegiaoEntity extends Equatable {
  int id;
  String sigla;
  String nome;

  RegiaoEntity({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  @override
  List<Object?> get props => [id, sigla, nome];

  
}
