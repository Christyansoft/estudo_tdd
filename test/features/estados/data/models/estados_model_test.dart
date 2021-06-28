import 'dart:convert';

import 'package:estudo_tdd/features/estados/data/models/estado_model.dart';
import 'package:estudo_tdd/features/estados/data/models/regiao_model.dart';
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tEstadoModel = EstadoModel(
    id: 12,
    sigla: 'AC',
    nome: 'Acre',
    regiao: RegiaoModel(
      id: 1,
      sigla: 'N',
      nome: 'Norte',
    ),
  );

  test('should be a subclass of EstadoEntity', () {
    //assert
    expect(tEstadoModel, isA<EstadoEntity>());
  });

  test('FromJson - Verify if return a estado model when json is passed', () {
    //arrange
    final jsonDecode = json.decode(readJson('estado.json'));

    //act
    final result = EstadoModel.fromJson(jsonDecode);

    //assert
    expect(result, tEstadoModel);
  });
}
