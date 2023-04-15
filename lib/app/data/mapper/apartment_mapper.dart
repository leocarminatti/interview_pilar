import 'package:interview_pilar/app/data/model/apartment_model.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';

class ApartmentMapper {
  static ApartmentEntity mapModelToEntity(ApartmentModel model) =>
      ApartmentEntity(
        propertyType: model.propertyType,
        address: model.address,
        askingPrice: model.askingPrice,
        bedrooms: model.bedrooms,
        number: model.number,
        parkingSpots: model.parkingSpots,
        suites: model.suites,
        image: model.images!.first.url,
      );
}
