import 'package:flutter/material.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/core/extensions/int_extensions.dart';
import 'package:interview_pilar/core/theme/pilar_textstyle.dart';

class ApartmentCard extends StatelessWidget {
  final ApartmentEntity apartment;

  const ApartmentCard({
    super.key,
    required this.apartment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .5 - 16,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 16,
        bottom: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image.network(apartment.image!),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text('${apartment.address}, ${apartment.number}'),
          const SizedBox(
            height: 10,
          ),
          Text(apartment.propertyType!),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${apartment.askingPrice == null ? 0 : apartment.askingPrice!.formatCurrency}',
            style: PilarTextStyle.Label(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            _apartmentParts,
          ),
        ],
      ),
    );
  }

  String get _apartmentParts =>
      '${apartment.bedrooms == null ? 0 : apartment.bedrooms!}QT ${apartment.suites == null ? 0 : apartment.suites!}ST ${apartment.parkingSpots == null ? 0 : apartment.parkingSpots!}VG';
}
