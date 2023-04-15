import 'package:flutter_test/flutter_test.dart';
import 'package:interview_pilar/app/data/data_sources/remote/apartment_data_source.dart';
import 'package:interview_pilar/app/data/model/apartment_model.dart';

void main() {
  late ApartmentDataDource dataDource;

  setUpAll(() {
    dataDource = ApartmentDataDource();
  });

  test('Should return List<Map> of apartments', () async {
    final result = await dataDource.request();

    expect(result, isNotEmpty);
  });

  test('Should return List<ApartmentModel> of apartments', () async {
    final result = await dataDource.getApartments();

    expect(result, isA<List<ApartmentModel>>());
  });
}
