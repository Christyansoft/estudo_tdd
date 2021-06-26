
import 'package:dartz/dartz.dart';
import 'package:estudo_tdd/core/error/failures.dart';
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';

abstract class IEstadosRepository {

  Future<Either<Failure, List<EstadoEntity>>> getEstados();

}