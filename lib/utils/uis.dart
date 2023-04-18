import 'package:flutter/material.dart';
import 'package:yfy_invoice_generator/screen/preview_screen.dart';

TableRow tableColumn({
  required String r1,
  required String r2,
  required String r3,
  required String r4,
  required String r5,
  required String r6,
  required String r7,
  Color fcolor: Colors.white,
  FontWeight fweight: FontWeight.bold,
  double fsize: 20.0,
  String ffamily: 'Myanmar',
  double theight: 30,
  Color bgColor: PreviewScreen.accentColor,
}) {
  return TableRow(
    decoration: BoxDecoration(color: bgColor),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r1,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r2,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r3,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r4,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r5,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r6,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r7,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
    ],
  );
}

TableRow tableRow({
  required String r1,
  required String r2,
  required String r3,
  required String r4,
  required String r5,
  required String r6,
  required String r7,
  Color fcolor: Colors.white,
  FontWeight fweight: FontWeight.normal,
  double fsize: 20.0,
  String ffamily: 'Myanmar',
  double theight: 30,
  bool selected = false,
}) {
  return TableRow(
    decoration: BoxDecoration(color: selected ? Colors.blue[50] : Colors.white),
    children: [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r1,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r2,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r3,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r4,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r5,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r6,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          height: theight,
          child: Center(
            child: text(
              text: r7,
              color: fcolor,
              weight: fweight,
              family: ffamily,
            ),
          ),
        ),
      ),
    ],
  );
}

Text text({
  required text,
  double size: 10,
  FontWeight weight: FontWeight.normal,
  FontStyle style: FontStyle.normal,
  String family: 'Courier',
  Color bgColor: Colors.transparent,
  Color color: Colors.white,
  bool tcapital: false,
}) {
  return Text(
    tcapital ? text.toUpperCase() : text,
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontFamily: family,
      backgroundColor: bgColor,
      color: color,
    ),
  );
}
