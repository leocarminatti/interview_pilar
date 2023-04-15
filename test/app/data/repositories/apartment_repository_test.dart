import 'package:flutter_test/flutter_test.dart';
import 'package:interview_pilar/app/data/data_sources/remote/data.dart';
import 'package:interview_pilar/app/data/data_sources/remote/i_apartment_data_source.dart';
import 'package:interview_pilar/app/data/model/apartment_model.dart';
import 'package:interview_pilar/app/data/repositories/apartment_repository.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements IApartmentDataDource {}

void main() {
  late MockDataSource dataSource;
  late ApartmentRepository repository;
  late List<ApartmentModel> apartments;

  setUpAll(() {
    dataSource = MockDataSource();
    repository = ApartmentRepository(dataSource);

    final response = data.map((e) => Map<String, dynamic>.from(e)).toList();
    apartments = response.map((e) => ApartmentModel.fromJson(e)).toList();
  });

  test('Should return list of ApartmentEntity', () async {
    when(() => dataSource.getApartments()).thenAnswer(
      (_) async => apartments,
    );

    final result = await repository.getApartments();

    expect(result, isNotEmpty);
    expect(result, isA<List<ApartmentEntity>>());
  });

  test('Should return Exception', () async {
    when(() => dataSource.getApartments()).thenThrow(
      (_) async => Exception(),
    );

    expect(repository.getApartments(), throwsA(isA<Exception>()));
  });
}
