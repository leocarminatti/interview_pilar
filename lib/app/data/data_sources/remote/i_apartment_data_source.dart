import 'package:interview_pilar/app/data/model/apartment_model.dart';

abstract class IApartmentDataDource {
  Future<List<ApartmentModel>> getApartments({String? search, String? orderBy});
}
