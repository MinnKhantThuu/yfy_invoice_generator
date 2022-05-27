import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstorage/localstorage.dart';
import 'package:yfy_invoice_generator/utils/constants.dart';

import './first_item_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final LocalStorage storage = LocalStorage('yfy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setConst();
    _loadNextPage();
  }

  void _loadNextPage() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacement(_createRoute());
  }

  void _setConst()async{
    final prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('dd') == null){
      prefs.setInt('dd', 1);
    }
    if(prefs.getInt('invoiceNumber') == null){
      prefs.setInt('invoiceNumber', 1);
    }
    // print(prefs.getInt('dd'));
    // print(prefs.getInt('invoiceNumber'));

    // Constants.dd = prefs.getInt('dd');
    // Constants.invoice = prefs.getInt('invoiceNumber');
    // print(Constants.dd);
    // print(Constants.invoice);
  }

  // void _setConst() {
  //   if (storage.getItem('dd') == null) {
  //     storage.setItem('dd', 1);
  //   }
  //   if (storage.getItem('invoiceNumber') == null) {
  //     storage.setItem('invoiceNumber', 1);
  //   }
  //   print(storage.getItem('dd'));
  //   print(storage.getItem('invoiceNumber'));
  // }

  // get dd => storage.getItem('dd');
  // get invoiceNumber => storage.getItem('invoiceNumber');

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
      transitionDuration: const Duration(milliseconds: 2000),
      pageBuilder: (context, animation, secondaryAnimation) => FirstItemScreen(
        // dd: storage.getItem('dd'),
        // invoice: storage.getItem('invoiceNumber'),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
