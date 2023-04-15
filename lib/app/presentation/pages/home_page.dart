import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilar/app/domain/entities/apartment_entity.dart';
import 'package:interview_pilar/app/presentation/cubit/home_cubit.dart';
import 'package:interview_pilar/app/presentation/widgets/apartment_card.dart';
import 'package:interview_pilar/app/presentation/widgets/search_bar.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';
import 'package:interview_pilar/core/theme/pilar_colors.dart';
import 'package:interview_pilar/core/theme/widgets/pilar_app_bar.dart';
import 'package:interview_pilar/locator.dart';

class HomePage extends StatelessWidget {
  late final HomeCubit controller;
  HomePage({
    Key? key,
  }) : super(key: key) {
    controller = getInstance.get<HomeCubit>()..getApartments();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: Scaffold(
        appBar: PilarAppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.handshake)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.login)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              BlocBuilder(
                bloc: controller,
                builder: (context, HomeState state) {
                  return _buildSearch(state.dropdownValue);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder(
                  bloc: controller,
                  builder: (context, HomeState state) {
                    if (state.loading) {
                      return const CircularProgressIndicator(
                        color: PilarColor.second,
                      );
                    } else if (state.apartments.isEmpty) {
                      return const Center(
                        child: Text('Nenhum imovel disponível!!!'),
                      );
                    }

                    return _buildGrid(state.apartments);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GridView _buildGrid(List<ApartmentEntity> apartments) {
    return GridView.builder(
      itemCount: apartments.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return GridTile(
          child: ApartmentCard(apartment: apartments[index]),
        );
      },
    );
  }

  SearchBar _buildSearch(OrderByType dropdownValue) {
    return SearchBar(
      controller: searchController,
      dropdownValue: dropdownValue.name,
      onPressedSearch: () {
        controller.getApartments(search: searchController.text);
      },
      onChangedDropdown: (String? value) {
        dropdownValue = OrderByType.values.singleWhere((e) => e.name == value!);
        controller.getApartments(orderBy: dropdownValue);
      },
    );
  }
}
