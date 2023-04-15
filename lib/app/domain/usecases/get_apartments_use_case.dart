import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/app/domain/repositories/i_apartment_repository.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';

abstract class IGetApartmentsUseCase {
  Future<List<ApartmentEntity>> call({String? search, OrderByType? orderBy});
}

class GetApartmentsUseCase implements IGetApartmentsUseCase {
  final IApartmentRepository repository;

  GetApartmentsUseCase(this.repository);

  @override
  Future<List<ApartmentEntity>> call(
      {String? search, OrderByType? orderBy}) async {
    return await repository.getApartments(search: search, orderBy: orderBy);
  }
}
