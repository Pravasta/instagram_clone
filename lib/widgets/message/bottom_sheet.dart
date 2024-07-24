import 'package:flutter/material.dart';

Future<dynamic> showBottomContent(
  BuildContext context,
  double height, {
  required Widget content,
}) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: content,
        ),
      );
    },
  );
}
