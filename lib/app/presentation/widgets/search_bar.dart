import 'package:flutter/material.dart';
import 'package:interview_pilar/core/enums/order_by_type.dart';
import 'package:interview_pilar/core/theme/pilar_colors.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    super.key,
    required this.dropdownValue,
    this.onChangedDropdown,
    required this.onPressedSearch,
    required this.controller,
  });

  List<String> list = OrderByType.values.map((e) => e.name).toList();
  final String dropdownValue;
  final Function(String?)? onChangedDropdown;
  final Function()? onPressedSearch;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: IconButton(
                onPressed: onPressedSearch,
                icon: const Icon(
                  Icons.search,
                  color: PilarColor.second,
                ),
              ),
            ),
            cursorColor: PilarColor.second,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        DecoratedBox(
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: PilarColor.primary,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
          ),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.arrow_drop_down,
                color: PilarColor.second,
                size: 25,
              ),
            ),
            elevation: 16,
            style: const TextStyle(color: PilarColor.second),
            underline: const SizedBox.shrink(),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            onChanged: onChangedDropdown,
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
