import 'package:interview_pilar/app/data/data_sources/remote/apartment_data_source.dart';
import 'package:interview_pilar/app/data/data_sources/remote/i_apartment_data_source.dart';
import 'package:interview_pilar/app/data/repositories/apartment_repository.dart';
import 'package:interview_pilar/app/domain/repositories/i_apartment_repository.dart';
import 'package:interview_pilar/app/domain/usecases/get_apartments_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:interview_pilar/app/presentation/cubit/home_cubit.dart';

GetIt getInstance = GetIt.instance;

Future setupLocator() async {
  ///DataSources
  getInstance
      .registerFactory<IApartmentDataDource>(() => ApartmentDataDource());

  ///Repositories
  getInstance.registerFactory<IApartmentRepository>(
      () => ApartmentRepository(getInstance()));

  ///UseCases
  getInstance.registerFactory<IGetApartmentsUseCase>(
      () => GetApartmentsUseCase(getInstance()));

  ///Cubit
  getInstance.registerLazySingleton(() => HomeCubit(getInstance()));
}
