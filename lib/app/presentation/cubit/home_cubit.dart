import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/app/domain/usecases/get_apartments_use_case.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IGetApartmentsUseCase getApartmentsUseCase;

  HomeCubit(
    this.getApartmentsUseCase,
  ) : super(
          const HomeState(
            loading: false,
            apartments: [],
            dropdownValue: OrderByType.high,
          ),
        );

  void getApartments({String? search, OrderByType? orderBy}) async {
    emit(state.copyWith(loading: true));
    try {
      var response =
          await getApartmentsUseCase(search: search, orderBy: orderBy);

      emit(
        state.copyWith(
          loading: false,
          apartments: response,
          dropdownValue: orderBy,
        ),
      );
    } on Exception {
      emit(state.copyWith(loading: false));
    }
  }
}
