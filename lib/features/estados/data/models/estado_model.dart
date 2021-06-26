import 'package:estudo_tdd/features/estados/data/models/regiao_model.dart';
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:estudo_tdd/features/estados/domain/entities/regiao_entity.dart';

// ignore: must_be_immutable
class EstadoModel extends EstadoEntity {
  EstadoModel({
    required int id,
    required String sigla,
    required String nome,
    required RegiaoEntity regiao,
  }) : super(
          id: id,
          sigla: sigla,
          nome: nome,
          regiao: regiao,
        );

  factory EstadoModel.fromJson(Map<String, dynamic> json) => EstadoModel(
        id: json['id'],
        sigla: json['sigla'],
        nome: json['nome'],
        regiao: RegiaoModel.fromJson(json['regiao']),
      );
}
