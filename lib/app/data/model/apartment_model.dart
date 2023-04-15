import 'package:interview_pilar/app/data/model/ad_model.dart';
import 'package:interview_pilar/app/data/model/images_model.dart';
import 'package:interview_pilar/app/data/model/people_model.dart';

class ApartmentModel {
  Id? iId;
  String? propertyType;
  String? address;
  String? number;
  String? unit;
  String? building;
  String? region;
  String? city;
  String? state;
  String? zipcode;
  double? lat;
  double? lng;
  int? bedrooms;
  int? suites;
  int? bathrooms;
  int? parkingSpots;
  double? area;
  int? totalArea;
  int? condoFee;
  int? tax;
  int? askingPrice;
  int? rentPrice;
  List<PeopleModel>? people;
  String? frontdeskHours;
  int? floor;
  String? developmentStage;
  List<String>? features;
  String? companyId;
  String? createdAt;
  List<ImagesModel>? images;
  String? updatedAt;
  AdModel? ad;
  String? commercialId;
  bool? isExclusive;
  String? notes;

  ApartmentModel({
    this.iId,
    this.propertyType,
    this.address,
    this.number,
    this.unit,
    this.building,
    this.region,
    this.city,
    this.state,
    this.zipcode,
    this.lat,
    this.lng,
    this.bedrooms,
    this.suites,
    this.bathrooms,
    this.parkingSpots,
    this.area,
    this.totalArea,
    this.condoFee,
    this.tax,
    this.askingPrice,
    this.rentPrice,
    this.people,
    this.frontdeskHours,
    this.floor,
    this.developmentStage,
    this.features,
    this.companyId,
    this.createdAt,
    this.images,
    this.updatedAt,
    this.ad,
    this.commercialId,
    this.isExclusive,
    this.notes,
  });

  ApartmentModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? Id.fromJson(json['_id']) : null;
    propertyType = json['property_type'];
    address = json['address'];
    number = json['number'];
    unit = json['unit'];
    building = json['building'];
    region = json['region'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    lat = json['lat'];
    lng = json['lng'];
    bedrooms = json['bedrooms'];
    suites = json['suites'];
    bathrooms = json['bathrooms'];
    parkingSpots = json['parking_spots'];
    area =
        json['area'] is int ? (json['area'] as int).toDouble() : json['area'];
    totalArea = json['total_area'];
    condoFee = json['condo_fee'];
    tax = json['tax'];
    askingPrice = json['asking_price'];
    rentPrice = json['rent_price'];
    if (json['people'] != null) {
      people = <PeopleModel>[];
      json['people'].forEach((v) {
        people!.add(PeopleModel.fromJson(v));
      });
    }
    frontdeskHours = json['frontdesk_hours'];
    floor = json['floor'];
    developmentStage = json['development_stage'];
    features = json['features'].cast<String>();
    companyId = json['company_id'];
    createdAt = json['created_at'];
    if (json['images'] != null) {
      images = <ImagesModel>[];
      json['images'].forEach((v) {
        images!.add(ImagesModel.fromJson(v));
      });
    }
    updatedAt = json['updated_at'];
    ad = json['ad'] != null ? AdModel.fromJson(json['ad']) : null;
    commercialId = json['commercial_id'];
    isExclusive = json['is_exclusive'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (iId != null) {
      data['_id'] = iId!.toJson();
    }
    data['property_type'] = propertyType;
    data['address'] = address;
    data['number'] = number;
    data['unit'] = unit;
    data['building'] = building;
    data['region'] = region;
    data['city'] = city;
    data['state'] = state;
    data['zipcode'] = zipcode;
    data['lat'] = lat;
    data['lng'] = lng;
    data['bedrooms'] = bedrooms;
    data['suites'] = suites;
    data['bathrooms'] = bathrooms;
    data['parking_spots'] = parkingSpots;
    data['area'] = area;
    data['total_area'] = totalArea;
    data['condo_fee'] = condoFee;
    data['tax'] = tax;
    data['asking_price'] = askingPrice;
    data['rent_price'] = rentPrice;
    if (people != null) {
      data['people'] = people!.map((v) => v.toJson()).toList();
    }
    data['frontdesk_hours'] = frontdeskHours;
    data['floor'] = floor;
    data['development_stage'] = developmentStage;
    data['features'] = features;
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['updated_at'] = updatedAt;
    if (ad != null) {
      data['ad'] = ad!.toJson();
    }
    data['commercial_id'] = commercialId;
    data['is_exclusive'] = isExclusive;
    data['notes'] = notes;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    return data;
  }
}
