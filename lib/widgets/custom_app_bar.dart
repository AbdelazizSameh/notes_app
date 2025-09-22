import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
    this.tapped = false,
    this.searchHintText,
    this.onChanged,
  });
  final String text;
  final IconData icon;
  final VoidCallback? onTap;
  final bool tapped;
  final String? searchHintText;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: const TextStyle(fontSize: 28)),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: child,
                ),
              );
            },
            child: tapped
                ? Padding(
                    key: const ValueKey('searchField'),
                    padding: const EdgeInsets.only(left: 16.0, right: 8),
                    child: SizedBox(
                      height: 45,
                      child: CustomTextField(
                        suffixIcon: Icons.search,
                        hintText: searchHintText ?? '',
                        onChanged: onChanged,
                      ),
                    ),
                  )
                : Container(key: const ValueKey('titleText')),
          ),
        ),

        CustomIcon(icon: icon, onTap: onTap),
      ],
    );
  }
}
