import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 24),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 165, 186, 194),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(right: 0),
            title: Text(
              'Flutter tips',
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 5),
              child: Text(
                'Build your career with tharwat samy',
                style: TextStyle(
                  color: const Color.fromARGB(255, 122, 122, 122),
                  fontSize: 20,
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(
                  bottom: 30.0,
                  left: 16,
                  right: 10,
                ),
                child: Icon(Icons.delete, color: Colors.black, size: 30),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'May21 , 2022',
              style: TextStyle(
                color: const Color.fromARGB(255, 122, 122, 122),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
