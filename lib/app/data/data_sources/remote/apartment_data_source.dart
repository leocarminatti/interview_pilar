import 'package:interview_pilar/app/data/data_sources/remote/data.dart';
import 'package:interview_pilar/app/data/data_sources/remote/i_apartment_data_source.dart';
import 'package:interview_pilar/app/data/model/apartment_model.dart';

class ApartmentDataDource implements IApartmentDataDource {
  Future<List<Map<String, dynamic>>> request() async {
    return data.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  @override
  Future<List<ApartmentModel>> getApartments(
      {String? search, String? orderBy}) async {
    final response = await request();

    return response.map((e) => ApartmentModel.fromJson(e)).toList();
  }
}
