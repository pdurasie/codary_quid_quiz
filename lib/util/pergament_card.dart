import 'package:flutter/material.dart';

class PergamentCard extends StatelessWidget {
  final Widget child;
  final bool stretchWide;
  const PergamentCard({Key? key, required this.child, this.stretchWide = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 5,
        child: Container(
          constraints: BoxConstraints(
              minHeight: 200, minWidth: stretchWide ? double.infinity : 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pergament.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.05), BlendMode.darken))),
          child: child,
        ));
  }
}
