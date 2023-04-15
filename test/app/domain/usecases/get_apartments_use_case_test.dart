import 'package:flutter_test/flutter_test.dart';
import 'package:interview_pilar/app/data/repositories/apartment_repository.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/app/domain/usecases/get_apartments_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockApartmentRepository extends Mock implements ApartmentRepository {}

void main() {
  late MockApartmentRepository repository;
  late GetApartmentsUseCase useCase;

  setUpAll(() {
    repository = MockApartmentRepository();
    useCase = GetApartmentsUseCase(repository);
  });

  test('Should return list of ApartmentEntity', () async {
    when(() => repository.getApartments()).thenAnswer(
      (_) async => [
        ApartmentEntity(
          address: 'Rua Teste',
          askingPrice: 1000,
          bedrooms: 2,
          number: '12',
          parkingSpots: 1,
          propertyType: 'Apartamento',
          suites: 1,
        )
      ],
    );

    final result = await useCase();

    expect(result, isNotEmpty);
    expect(result, isA<List<ApartmentEntity>>());
  });
}
