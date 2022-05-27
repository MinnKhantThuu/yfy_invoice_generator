import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/first_item_screen.dart';
import '../utils/constants.dart';
import '../widgets/designed_button_widget.dart';

class PreviewScreen extends StatefulWidget {
  final Map<dynamic, dynamic> userData;
  final List listInvoiceData;
  final num subTotal;
  final getInvoice;

  PreviewScreen({
    Key? key,
    required this.userData,
    required this.listInvoiceData,
    required this.subTotal,
    required this.getInvoice,
  }) : super(key: key);

  static const Color accentColor = Color(0xff174066);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {

  // _getConst()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getInt('invoiceNumber');
  // }
  //
  // get _getInvoice => _getConst();

  late Uint8List _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  var todayDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  int totalAmount = 0;

  final currencyFormat = NumberFormat("#,##0", "en_US");


  _showMaterialDialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.symmetric(vertical: 300, horizontal: 20),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        title: Center(
          child: SvgPicture.asset('assets/images/check.svg'),
        ),
        content: const Center(
          child: Text(
            'Your Invoice is Exported!',
            style: TextStyle(
              color: PreviewScreen.accentColor,
            ),
          ),
        ),
        actions: <Widget>[
          DesignedButton(
            text: 'OK',
            svg: 'confirm',
            function: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FirstItemScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: PreviewScreen.accentColor,
        elevation: 0,
        toolbarHeight: 0,
        toolbarOpacity: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Image.asset(
                  'assets/images/1-1.png',
                  width: 180,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Your Invoice is Here!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: PreviewScreen.accentColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    // width: MediaQuery.of(context).size.width - 20,
                    width: 380,
                    height: 560,
                    // height: 537,
                    decoration: BoxDecoration(
                      border: Border.all(color: PreviewScreen.accentColor),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: Image.asset(
                                  'assets/images/1-1.png',
                                  width: 130,
                                ),
                              ),
                              const SizedBox(
                                width: 130,
                                child: Text(
                                  'yearnforyarns2721@gmail.com\n                     +95 09 420867671',
                                  style: TextStyle(
                                    fontSize: 9.0,
                                    color: PreviewScreen.accentColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: PreviewScreen.accentColor,
                            indent: 10.0,
                            endIndent: 10.0,
                          ),
                          const Center(
                            child: Text(
                              'Your satisfaction is our utmost priority!',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.0,
                                color: PreviewScreen.accentColor,
                              ),
                            ),
                          ),
                          Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 10.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Customer Name : ',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: PreviewScreen.accentColor,
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                            maxWidth: 200,
                                          ),
                                          child: Text(
                                            widget.userData['receiverName'],
                                            style: const TextStyle(
                                              fontSize: 9.0,
                                              color: PreviewScreen.accentColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          'Phone Number : ',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: PreviewScreen.accentColor,
                                          ),
                                        ),
                                        Text(
                                          widget.userData['phoneName'],
                                          style: const TextStyle(
                                            fontSize: 9.0,
                                            color: PreviewScreen.accentColor,
                                            letterSpacing: 0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Address : ',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: PreviewScreen.accentColor,
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 320.0),
                                          child: Text(
                                            widget.userData['address'],
                                            style: const TextStyle(
                                              fontSize: 9.0,
                                              color: PreviewScreen.accentColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Remark : ',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.bold,
                                            color: PreviewScreen.accentColor,
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 320.0),
                                          child: Text(
                                            widget.userData['remark'],
                                            style: const TextStyle(
                                              fontSize: 9.0,
                                              color: PreviewScreen.accentColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Row(
                                  children: [
                                    const Text(
                                      'Date : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Text(
                                      todayDate,
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 25,
                                right: 10,
                                child: Row(
                                  children: [
                                    const Text(
                                      'Order ID : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Text(
                                      '${Constants.month}/${widget.getInvoice.toString().padLeft(4, '0')}',
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 40,
                                right: 10,
                                child: Row(
                                  children: [
                                    const Text(
                                      'Sale Person : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Text(
                                      '${widget.userData['salePerson']}',
                                      style: const TextStyle(
                                        fontSize: 9.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(
                              8.0,
                            ),
                            child: Text(
                              'Your Order Details is : ',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: PreviewScreen.accentColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 380,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Center(
                                child: DataTable(
                                  horizontalMargin: 3,
                                  // border: TableBorder.all(
                                  //   color: const Color(0xffEEEEEE),
                                  // ),
                                  showBottomBorder: true,
                                  dividerThickness: 0.2,
                                  headingRowColor: MaterialStateProperty.all(
                                      PreviewScreen.accentColor),
                                  // columnSpacing: 14.5,
                                  columnSpacing: 20,
                                  dataRowHeight: 18,
                                  headingRowHeight: 26.0,
                                  columns: const [
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'No.',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Item Name',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Sticker',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Color',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Price',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Qty',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          'Amount',
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: widget.listInvoiceData
                                      .map(
                                        (invoiceData) => DataRow(
                                          selected: widget.listInvoiceData
                                                          .indexOf(
                                                              invoiceData) %
                                                      2 ==
                                                  0
                                              ? false
                                              : true,
                                          cells: [
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 5.0,
                                                  minWidth: 5.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${widget.listInvoiceData.indexOf(invoiceData) + 1}',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 50.0,
                                                  minWidth: 50.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${invoiceData['itemName']}',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 30.0,
                                                  minWidth: 30.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${invoiceData['sticker']}',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 30.0,
                                                  minWidth: 30.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${invoiceData['color']}',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 50.0,
                                                  minWidth: 50.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${currencyFormat.format(int.parse(invoiceData['price'].toString().split('.')[0]))} MMK',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 10.0,
                                                  minWidth: 10.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${invoiceData['quantity']}',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              ConstrainedBox(
                                                constraints:
                                                    const BoxConstraints(
                                                  maxWidth: 50,
                                                  minWidth: 50.0,
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Text(
                                                    '${currencyFormat.format(int.parse(invoiceData['totalAmount'].toString().split('.')[0]))} MMK',
                                                    style: const TextStyle(
                                                      fontSize: 10.0,
                                                      color: PreviewScreen
                                                          .accentColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: PreviewScreen.accentColor,
                            indent: 10.0,
                            endIndent: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Subtotal : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${currencyFormat.format(int.parse(widget.subTotal.toString().split('.')[0]))} MMK',
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          color: PreviewScreen.accentColor,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        color: const Color(0xffF5F5F5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Delivery Fee : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${currencyFormat.format(widget.userData['deliveryFee'])} MMK',
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          color: PreviewScreen.accentColor,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        color: const Color(0xffF5F5F5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Total : ',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: PreviewScreen.accentColor,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        // '${int.parse(widget.subTotal.toString().split('.')[0]) + int.parse(widget.userData['deliveryFee'].toString())} MMK',
                                        '${currencyFormat.format(int.parse(widget.subTotal.toString().split('.')[0]) + int.parse(widget.userData['deliveryFee'].toString()))} MMK',
                                        style: const TextStyle(
                                            fontSize: 10.0,
                                            color: PreviewScreen.accentColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        color: const Color(0xffF5F5F5),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 1.5,
                            color: PreviewScreen.accentColor,
                            indent: 10.0,
                            endIndent: 10.0,
                          ),
                          // const SizedBox(
                          //   height: 100,
                          // ),
                          const Center(
                            child: Text(
                              'Thanks for being one of our success stories',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.0,
                                color: PreviewScreen.accentColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Center(
                  child: DesignedButton(
                    text: 'Export',
                    svg: 'confirm',
                    function: () async {
                      Uint8List? image = await screenshotController.capture(
                          pixelRatio: MediaQuery.of(context).devicePixelRatio);
                      setState(() {
                        _imageFile = image!;
                      });
                      await ImageGallerySaver.saveImage(
                        Uint8List.fromList(image!),
                        quality: 60,
                        name: "YFY_${DateTime.now().toIso8601String()}",
                      );
                      // print('Result is $result');
                      // Constants.invoiceNumber++;
                      _increaseInvoice();
                      Constants.listInvoiceData = [];
                      _showMaterialDialog(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _increaseInvoice() async {
    int i = widget.getInvoice + 1;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('invoiceNumber', i);
  }
}
