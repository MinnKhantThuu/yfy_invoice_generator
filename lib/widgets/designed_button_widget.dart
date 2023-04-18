import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DesignedButton extends StatelessWidget {
  final String text, svg;
  final Function function;
  int? count;

  DesignedButton(
      {Key? key,
      required this.text,
      required this.svg,
      required this.function,
      this.count})
      : super(key: key);

  static const Color accentColor = Color(0xff174066);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 10,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
        ),
        onPressed: () => function(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/$svg.svg',
              width: 10,
              height: 10,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              // textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            count == null
                ? const Text('')
                : count != 0
                    ? Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0)),
                        child: Center(
                          child: Text(
                            count == 0 ? '' : count.toString(),
                            style: const TextStyle(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : Container(),
          ],
        ),
      ),
    );
  }
}
