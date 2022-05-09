import 'dart:async';

import 'package:flutter/material.dart';

import './first_item_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadNextPage();
  }

  void _loadNextPage()async{
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(_createRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff174066),
      child: Center(
        child: Image.asset(
          'assets/images/2-2.png',
          width: 90,
          height: 90,
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration : const Duration(milliseconds: 2000),
      pageBuilder: (context, animation, secondaryAnimation) => FirstItemScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
