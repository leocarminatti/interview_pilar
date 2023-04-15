import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';

abstract class IApartmentRepository {
  Future<List<ApartmentEntity>> getApartments(
      {String? search, OrderByType? orderBy});
}
