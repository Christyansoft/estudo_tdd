import 'package:dartz/dartz.dart';
import 'package:estudo_tdd/core/error/failures.dart';
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:estudo_tdd/features/estados/domain/entities/regiao_entity.dart';
import 'package:estudo_tdd/features/estados/domain/repositories/iestados_repository.dart';
import 'package:estudo_tdd/features/estados/domain/usecases/get_estados_usecase.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

//Faz o mock da implementação do repository para possibilitar o teste do usecase.
class MockEstadosRepository extends Mock implements IEstadosRepository {}

void main() {
  late GetEstadosUseCaseImpl usecase;
  late MockEstadosRepository repository;

  setUp(() {
    repository = MockEstadosRepository();
    usecase = GetEstadosUseCaseImpl(repository);
  });

  final tEstados = [
    EstadoEntity(
      id: 12,
      sigla: 'AC',
      nome: 'Acre',
      regiao: RegiaoEntity(
        id: 1,
        sigla: 'N',
        nome: 'Norte',
      ),
    )
  ];

  test('should return state from repository when call is successful', () async {
    //arrange
    when(() => repository.getEstados())
        .thenAnswer((_) async => Right(tEstados));

    //act
    final result = await usecase();

    //assert
    expect(result, Right(tEstados));

    verify(() => repository.getEstados());

    verifyNoMoreInteractions(repository);
  });

  test('should return state from repository when call is unsuccessful',
      () async {
    //arrange
    when(() => repository.getEstados())
        .thenAnswer((_) async => Left(ServerFailure()));

    //act
    final result = await usecase();

    //assert
    expect(result, Left(ServerFailure()));

    verify(() => repository.getEstados()).called(1);
  });
}
