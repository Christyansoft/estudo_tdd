import 'package:dio/native_imp.dart';
import 'package:estudo_tdd/core/http_client/http_client.dart';
import 'package:dio/dio.dart';
import 'package:estudo_tdd/features/estados/data/endpoints/estado_endpoints.dart';

class HttpImpl implements HttpClient {
  final DioForNative _client =
      DioForNative(BaseOptions(baseUrl: EstadoEndpoints.ufEndpoint));

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _client.get(url);
    return HttpResponse(data: response.data, statusCode: response.statusCode);
  }
}
