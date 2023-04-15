part of 'home_cubit.dart';

class HomeState extends Equatable {
  final bool loading;
  final List<ApartmentEntity> apartments;
  final OrderByType dropdownValue;

  const HomeState({
    required this.loading,
    required this.apartments,
    required this.dropdownValue,
  });

  HomeState copyWith({
    bool? loading,
    List<ApartmentEntity>? apartments,
    OrderByType? dropdownValue,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      apartments: apartments ?? this.apartments,
      dropdownValue: dropdownValue ?? this.dropdownValue,
    );
  }

  @override
  List<Object> get props => [loading, apartments, dropdownValue];
}
