import 'package:dartz/dartz.dart';
import 'package:estudo_tdd/core/error/exceptions.dart';
import 'package:estudo_tdd/core/error/failures.dart';
import 'package:estudo_tdd/features/estados/data/datasources/iestados_datasource.dart';
import 'package:estudo_tdd/features/estados/data/models/estado_model.dart';
import 'package:estudo_tdd/features/estados/data/models/regiao_model.dart';
import 'package:estudo_tdd/features/estados/data/repositories/estados_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockEstadosDatasource extends Mock implements IEstadosDatasource {}

void main() {
  late EstadosRepositoryImpl repository;
  late IEstadosDatasource datasource;

  setUp(() {
    datasource = MockEstadosDatasource();
    repository = EstadosRepositoryImpl(datasource);
  });

  final tEstados = [
    EstadoModel(
      id: 12,
      sigla: 'AC',
      nome: 'Acre',
      regiao: RegiaoModel(
        id: 1,
        sigla: 'N',
        nome: 'Norte',
      ),
    )
  ];

  test('should return a list of estado model when call is successful',
      () async {
    //Arrange
    when(() => datasource.getAllEstados()).thenAnswer((_) async => tEstados);

    //act
    final result = await repository.getEstados();

    //assert
    expect(result, Right(tEstados));

    verify(() => datasource.getAllEstados());
  });

  test('should return a Excpetion when call is unsuccessful',
      () async {
    //Arrange
    when(() => datasource.getAllEstados()).thenThrow(ServerException());

    //act
    final result = await repository.getEstados();

    //assert
    expect(result, Left(ServerFailure()));

    verify(() => datasource.getAllEstados());
  });

}
