import 'package:flutter/material.dart';
import 'package:notes_app/widgets/color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ColorItem(),
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(width: 10),
      ),
    );
  }
}
