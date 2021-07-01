import 'package:estudo_tdd/core/error/exceptions.dart';
import 'package:estudo_tdd/core/http_client/http_client.dart';
import 'package:estudo_tdd/features/estados/data/datasources/iestados_datasource.dart';
import 'package:estudo_tdd/features/estados/data/endpoints/estado_endpoints.dart';
import 'package:estudo_tdd/features/estados/data/models/estado_model.dart';

class EstadosDatasourceImpl implements IEstadosDatasource {
  final HttpClient _client;

  EstadosDatasourceImpl(this._client);

  @override
  Future<List<EstadoModel>> getAllEstados() async {
    final response = await _client.get(EstadoEndpoints.ufEndpoint);

    if (response.statusCode == 200) {

      final result =
          (response.data as List).map((e) => EstadoModel.fromJson(e)).toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
