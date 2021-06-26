import 'package:estudo_tdd/core/error/exceptions.dart';
import 'package:estudo_tdd/features/estados/data/datasources/iestados_datasource.dart';
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:estudo_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:estudo_tdd/features/estados/domain/repositories/iestados_repository.dart';

class EstadosRepositoryImpl implements IEstadosRepository {
  final IEstadosDatasource datasource;

  EstadosRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<EstadoEntity>>> getEstados() async {
    try {
      final result = await datasource.getAllEstados();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
