import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/preview_screen.dart';
import '../utils/constants.dart';
import '../widgets/designed_button_widget.dart';
import '../widgets/text_input_widget.dart';

class FirstItemScreen extends StatefulWidget {
  static const Color accentColor = Color(0xff174066);

  const FirstItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstItemScreen> createState() => _FirstItemScreenState();
}

class _FirstItemScreenState extends State<FirstItemScreen> {
  // final LocalStorage storage = LocalStorage('yfy');

  @override
  void initState() {
    super.initState();
    _setConstants();
  }

  _setConstants() async {
    final prefs = await SharedPreferences.getInstance();
    Constants.dd = prefs.getInt('dd');
    Constants.invoice = prefs.getInt('invoiceNumber');
    // print(Constants.dd);
    // print(Constants.invoice);
  }

  TextEditingController receiverNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController deliveryFeeController = TextEditingController();
  TextEditingController salePersonController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController stickerController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController orderController = TextEditingController();

  bool _isInvoiceEmpty = false;
  bool _isUserDataEmpty = false;

  // late int dd;
  // late int invoice;

  // _getConst() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // print(prefs.get('dd'));
  //   return prefs.getInt('dd');
  // }

  // get _dd => _getConst().then((value) => value);

  // _getConst(){
  //   return storage.getItem('dd');
  // }

  // _invoice() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // print(prefs.get('invoiceNumber'));
  //   return prefs.getInt('invoiceNumber');
  // }

  // get _getInvoice => _invoice();

  // _invoice(){
  //   return storage.getItem('invoiceNumber');
  // }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: const Text(
              'Do you want to exit?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FirstItemScreen.accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: FirstItemScreen.accentColor,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: FirstItemScreen.accentColor,
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
                Image.asset(
                  'assets/images/1-1.png',
                  width: 180,
                ),
                const SizedBox(
                  height: 25,
                ),
                TextInput(
                  controller: receiverNameController,
                  text: 'Receiver Name',
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: phoneNumberController,
                  text: 'Phone Number',
                  // isNumKeyboard: true,
                  textInputAction: true,
                  // inputFormatter: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: addressController,
                  text: 'Address',
                  isTextArea: true,
                  textInputAction: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInput(
                          controller: deliveryFeeController,
                          text: 'Delivery Fee',
                          isNumKeyboard: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextInput(
                          controller: salePersonController,
                          text: 'Sale Person',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: orderController,
                  text: 'Order No.',
                  isNumKeyboard: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: remarkController,
                  text: 'Remark',
                  isTextArea: true,
                  textInputAction: true,
                ),
                _isUserDataEmpty == false
                    ? const SizedBox(
                        height: 20.0,
                      )
                    : const Center(
                        child: SizedBox(
                          height: 25,
                          child: Text(
                            'Please, full fill customer info',
                            style: TextStyle(
                              color: TextInput.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'Order Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: FirstItemScreen.accentColor,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: FirstItemScreen.accentColor,
                          thickness: 1.0,
                          indent: 15.0,
                          endIndent: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInput(
                          controller: itemNameController,
                          text: 'Item Name',
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextInput(
                          controller: stickerController,
                          text: 'Details',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // TextInput(
                //   controller: colorController,
                //   text: 'Color',
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInput(
                          controller: colorController,
                          text: 'Color',
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextInput(
                          controller: discountController,
                          text: 'Discount',
                          isNumKeyboard: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextInput(
                          controller: priceController,
                          text: 'Price',
                          isNumKeyboard: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextInput(
                          controller: quantityController,
                          text: 'Quantity',
                          isNumKeyboard: true,
                        ),
                      ),
                    ],
                  ),
                ),
                _isInvoiceEmpty == false
                    ? const SizedBox(
                        height: 20.0,
                      )
                    : const Center(
                        child: SizedBox(
                          height: 25,
                          child: Text(
                            'Do not empty input form',
                            style: TextStyle(
                              color: TextInput.accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DesignedButton(
                          text: 'Save',
                          svg: 'save',
                          count: Constants.listInvoiceData.length,
                          function: () {
                            if (itemNameController.value.text.isEmpty ||
                                colorController.value.text.isEmpty ||
                                priceController.value.text.isEmpty ||
                                quantityController.value.text.isEmpty) {
                              setState(() {
                                _isInvoiceEmpty = true;
                              });
                              return;
                            }
                            // print(itemNameController.value.text);
                            // print(stickerController.value.text);
                            // print(colorController.value.text);
                            // print(discountController.value.text);
                            // print(priceController.value.text);
                            // print(quantityController.value.text);

                            setState(() => _saveInvoice());
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        child: DesignedButton(
                          text: 'Confirm',
                          svg: 'confirm',
                          function: () async {
                            // print(receiverNameController.value.text);
                            // print(phoneNumberController.value.text);
                            // print(addressController.value.text);
                            // print(deliveryFeeController.value.text);
                            // print(remarkController.value.text);

                            // print(widget.dd);
                            // print(widget.invoice);

                            // _getConst().then((value) {
                            //   dd = value;
                            //   print(dd);
                            // });
                            // _invoice().then((value) {
                            //   invoice = value;
                            //   print(invoice);
                            // });

                            if (receiverNameController.value.text.isEmpty ||
                                phoneNumberController.value.text.isEmpty ||
                                addressController.value.text.isEmpty ||
                                salePersonController.value.text.isEmpty ||
                                orderController.value.text.isEmpty) {
                              setState(() {
                                _isUserDataEmpty = true;
                              });
                              return;
                            }

                            if (Constants.listInvoiceData.isEmpty) {
                              _saveInvoice();
                            }

                            String receiverName =
                                receiverNameController.value.text;
                            String phoneName = phoneNumberController.value.text;
                            String address = addressController.value.text;
                            int deliveryFee = deliveryFeeController
                                    .value.text.isEmpty
                                ? 0
                                : int.parse(deliveryFeeController.value.text);
                            String salePerson = salePersonController.value.text;
                            String remark = remarkController.value.text.isEmpty
                                ? ''
                                : remarkController.value.text;
                            int orderId = int.parse(orderController.value.text);
                            Map<dynamic, dynamic> userData = {};
                            userData['receiverName'] = receiverName;
                            userData['phoneName'] = phoneName;
                            userData['address'] = address;
                            userData['deliveryFee'] = deliveryFee;
                            userData['salePerson'] = salePerson;
                            userData['remark'] = remark;
                            userData['orderId'] = orderId;

                            var totalAmount = 0.0;
                            for (var subtotal in Constants.listInvoiceData.map(
                                (invoiceData) => invoiceData['totalAmount'])) {
                              totalAmount += subtotal;
                            }

                            if (Constants.dd != Constants.nowMonth) {
                              // Constants.dd = Constants.nowMonth;
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setInt('dd', Constants.nowMonth);
                              await prefs.setInt('invoiceNumber', 1);
                              Constants.invoice = 1;
                            }
                            // print(userData);

                            Navigator.of(context).push(
                              _createRoute(userData, totalAmount),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveInvoice() {
    String itemName = itemNameController.value.text.isEmpty
        ? '-'
        : itemNameController.value.text;
    String sticker = stickerController.value.text.isEmpty
        ? '-'
        : stickerController.value.text;
    String color =
        colorController.value.text.isEmpty ? '-' : colorController.value.text;
    num discount = discountController.value.text.isEmpty
        ? 0
        : (int.parse(discountController.value.text) / 100) *
            int.parse(priceController.value.text);
    num price = discount == 0
        ? int.parse(priceController.value.text)
        : int.parse(priceController.value.text) - discount;
    int quantity = int.parse(quantityController.value.text);
    num totalAmount = price * quantity;

    Map<dynamic, dynamic> invoiceData = {};

    invoiceData['itemName'] = itemName;
    invoiceData['sticker'] = sticker;
    invoiceData['color'] = color;
    invoiceData['discount'] = discount;
    invoiceData['price'] = price;
    invoiceData['quantity'] = quantity;
    invoiceData['totalAmount'] = totalAmount;

    itemNameController.text = '';
    stickerController.text = '';
    colorController.text = '';
    discountController.text = '';
    priceController.text = '';
    quantityController.text = '';
    _isInvoiceEmpty = false;

    Constants.listInvoiceData.add(invoiceData);
    // print(invoiceData);
  }

  Route _createRoute(userData, totalAmount) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => PreviewScreen(
        userData: userData,
        listInvoiceData: Constants.listInvoiceData,
        subTotal: totalAmount,
        getInvoice: Constants.invoice,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

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
