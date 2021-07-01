import 'dart:convert';

import 'package:estudo_tdd/core/error/exceptions.dart';
import 'package:estudo_tdd/core/http_client/http_client.dart';
import 'package:estudo_tdd/features/estados/data/datasources/estados_datasource_impl.dart';
import 'package:estudo_tdd/features/estados/data/datasources/iestados_datasource.dart';
import 'package:estudo_tdd/features/estados/data/models/estado_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/estados_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late IEstadosDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = EstadosDatasourceImpl(client);
  });

  void successAnswer() {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: json.decode(estadosMock), statusCode: 200));
  }

  final urlExpected =
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

  final tEstados =
      (json.decode(estadosMock)).map((e) => EstadoModel.fromJson(e)).toList();

  test('verify if correct url is called', () async {
    //Arrange
    successAnswer();

    //Act
    await datasource.getAllEstados();
    //Expect
    verify(() => client.get(urlExpected));
  });

  test('should return list of estado model when is sucessful', () async {
    //Arrange
    successAnswer();
    await datasource.getAllEstados();

    // //Act
    final result = await datasource.getAllEstados();

    //Expect
    expect(result, tEstados);
  });

  test('should throw a ServerException when call is unsuccessful', () async {
    //Arrange
    when(() => client.get(any()))
        .thenAnswer((_) async => HttpResponse(data: 'error', statusCode: 400));

    // //Act
    //para capturar exceptions não precisa de await
    final result = datasource.getAllEstados();

    //Expect
    expect(result, throwsA(ServerException()));
  });
}
