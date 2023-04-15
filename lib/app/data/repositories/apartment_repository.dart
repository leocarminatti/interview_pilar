import 'package:interview_pilar/app/data/data_sources/remote/i_apartment_data_source.dart';
import 'package:interview_pilar/app/data/mapper/apartment_mapper.dart';
import 'package:interview_pilar/app/data/model/apartment_model.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/app/domain/repositories/i_apartment_repository.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';
import 'package:interview_pilar/core/extensions/string_extensions.dart';

class ApartmentRepository implements IApartmentRepository {
  final IApartmentDataDource dataSource;

  ApartmentRepository(this.dataSource);

  @override
  Future<List<ApartmentEntity>> getApartments(
      {String? search, OrderByType? orderBy}) async {
    try {
      List<ApartmentModel> result = await dataSource.getApartments();

      if (search != null && search.isNotEmpty) {
        result = _filter(result, search);
      }

      if (orderBy != null) {
        _orderBy(orderBy, result);
      }

      return result
          .map((model) => ApartmentMapper.mapModelToEntity(model))
          .toList();
    } catch (e) {
      throw Exception('Error get Random Apartments');
    }
  }

  List<ApartmentModel> _filter(List<ApartmentModel> result, String search) {
    result = result
        .where(
          (element) => _filterWhere(element, search),
        )
        .toList();
    return result;
  }

  void _orderBy(OrderByType orderBy, List<ApartmentModel> result) {
    if (orderBy == OrderByType.low) {
      result.sort((a, b) => a.askingPrice!.compareTo(b.askingPrice!));
    } else {
      result.sort((a, b) => b.askingPrice!.compareTo(a.askingPrice!));
    }
  }

  bool _filterWhere(ApartmentModel element, String search) {
    return element.address!.withoutDiacriticalMarks.toLowerCase().contains(
              search.withoutDiacriticalMarks.toLowerCase(),
            ) ||
        element.city!.withoutDiacriticalMarks.toLowerCase().contains(
              search.withoutDiacriticalMarks.toLowerCase(),
            ) ||
        (element.building!.withoutDiacriticalMarks.toLowerCase().contains(
              search.withoutDiacriticalMarks.toLowerCase(),
            ));
  }
}
