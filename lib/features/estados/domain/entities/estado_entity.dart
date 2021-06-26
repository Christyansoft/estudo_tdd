import 'package:equatable/equatable.dart';
import 'package:estudo_tdd/features/estados/domain/entities/regiao_entity.dart';

// ignore: must_be_immutable
class EstadoEntity extends Equatable {
  int id;
  String sigla;
  String nome;
  RegiaoEntity regiao;

  EstadoEntity({
    required this.id,
    required this.sigla,
    required this.nome,
    required this.regiao,
  });

  @override
  List<Object?> get props => [id, sigla, nome, regiao];
}
