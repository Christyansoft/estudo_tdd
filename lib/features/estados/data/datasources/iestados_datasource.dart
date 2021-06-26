import 'package:estudo_tdd/features/estados/data/models/estado_model.dart';

abstract class IEstadosDatasource {
  Future<List<EstadoModel>> getAllEstados();
}
