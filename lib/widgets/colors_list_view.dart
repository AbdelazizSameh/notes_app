import 'package:flutter/material.dart';
import 'package:notes_app/widgets/color_item.dart';

import '../constants.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => setState(() => currentIndex = index),
          child: ColorItem(
            isSelected: currentIndex == index,
            color: kColors[index],
          ),
        ),
        itemCount: kColors.length,
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
