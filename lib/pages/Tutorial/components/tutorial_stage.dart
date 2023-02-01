import 'package:flutter/material.dart';

class CurrentPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const CurrentPage(
      {super.key,
      required this.icon,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color.fromARGB(255, 136, 52, 114),
            size: 77.29,
          ),
          Text(title),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: size.width * 0.75,
            child: Center(
                child: Text(
              description,
              textAlign: TextAlign.center,
            )),
          ),
        ],
      ),
    );
  }
}
