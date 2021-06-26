import 'package:estudo_tdd/features/estados/domain/entities/estado_entity.dart';
import 'package:estudo_tdd/features/estados/domain/entities/regiao_entity.dart';

var estadosMock = [
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