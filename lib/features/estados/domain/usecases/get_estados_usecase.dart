
import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:estudo_tdd/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:estudo_tdd/features/estados/domain/repositories/iestados_repository.dart';
import 'package:estudo_tdd/features/estados/domain/usecases/interfaces/iget_all_estados_usecase.dart';

class GetEstadosUseCaseImpl implements IGetAllEstadosUseCase { 
  final IEstadosRepository repository;

  GetEstadosUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, List<EstadoEntity>>> call() async {
    return await repository.getEstados();
  }


}
