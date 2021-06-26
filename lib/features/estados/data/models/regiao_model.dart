import 'package:estudo_tdd/features/estados/domain/entities/regiao_entity.dart';

// ignore: must_be_immutable
class RegiaoModel extends RegiaoEntity {
  RegiaoModel({
    required id,
    required sigla,
    required nome,
  }) : super(
          id: id,
          sigla: sigla,
          nome: nome,
        );

  factory RegiaoModel.fromJson(Map<String, dynamic> json) => RegiaoModel(
        id: json['id'],
        sigla: json['sigla'],
        nome: json['nome'],
      );
}
