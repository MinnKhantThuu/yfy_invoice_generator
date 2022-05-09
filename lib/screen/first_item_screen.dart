import 'package:flutter/material.dart';

import '../screen/preview_screen.dart';
import '../utils/constants.dart';
import '../widgets/designed_button_widget.dart';
import '../widgets/text_input_widget.dart';

class FirstItemScreen extends StatefulWidget {
  static const Color accentColor = Color(0xff174066);

  FirstItemScreen({Key? key}) : super(key: key);

  @override
  State<FirstItemScreen> createState() => _FirstItemScreenState();
}

class _FirstItemScreenState extends State<FirstItemScreen> {

  TextEditingController receiverNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController deliveryFeeController = TextEditingController();

  TextEditingController remarkController = TextEditingController();

  TextEditingController itemNameController = TextEditingController();

  TextEditingController stickerController = TextEditingController();

  TextEditingController colorController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController quantityController = TextEditingController();

  TextEditingController discountController = TextEditingController();

  bool _isInvoiceEmpty = false;
  bool _isUserDataEmpty = false;

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
                  primary: FirstItemScreen.accentColor,
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
                  isNumKeyboard: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: addressController,
                  text: 'Address',
                  isTextArea: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: deliveryFeeController,
                  text: 'Delivery Fee',
                  isNumKeyboard: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextInput(
                  controller: remarkController,
                  text: 'Remark',
                  isTextArea: true,
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
                          text: 'Sticker',
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

                            String itemName = itemNameController.value.text;
                            String sticker = stickerController.value.text.isEmpty ? '-' : stickerController.value.text;
                            String color = colorController.value.text;
                            num discount = discountController.value.text.isEmpty
                                ? 0
                                : (int.parse(discountController.value.text) /
                                        100) *
                                    int.parse(priceController.value.text);
                            num price = discount == 0
                                ? int.parse(priceController.value.text)
                                : int.parse(priceController.value.text) -
                                    discount;
                            int quantity =
                                int.parse(quantityController.value.text);
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

                            // print('Map value is $invoiceData');
                            // print('${Constants.listInvoiceData}');
                            Constants.listInvoiceData.add(invoiceData);
                            // print('List Data value is ${Constants.listInvoiceData}');

                            setState(() {});
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
                          function: () {
                            // print(receiverNameController.value.text);
                            // print(phoneNumberController.value.text);
                            // print(addressController.value.text);
                            // print(deliveryFeeController.value.text);
                            // print(remarkController.value.text);

                            if (receiverNameController.value.text.isEmpty ||
                                phoneNumberController.value.text.isEmpty ||
                                addressController.value.text.isEmpty) {
                              setState(() {
                                _isUserDataEmpty = true;
                              });
                              return;
                            }

                            String receiverName =
                                receiverNameController.value.text;
                            String phoneName = phoneNumberController.value.text;
                            String address = addressController.value.text;
                            int deliveryFee = deliveryFeeController
                                    .value.text.isEmpty
                                ? 0
                                : int.parse(deliveryFeeController.value.text);
                            String remark = remarkController.value.text.isEmpty
                                ? ''
                                : remarkController.value.text;
                            Map<dynamic, dynamic> userData = {};
                            userData['receiverName'] = receiverName;
                            userData['phoneName'] = phoneName;
                            userData['address'] = address;
                            userData['deliveryFee'] = deliveryFee;
                            userData['remark'] = remark;

                            var totalAmount = 0.0;
                            for(var subtotal in Constants.listInvoiceData.map((invoiceData) => invoiceData['totalAmount'])){
                              totalAmount += subtotal;
                            }

                            if(Constants.dd != Constants.nowMonth){
                              Constants.dd = Constants.nowMonth;
                              Constants.invoiceNumber = 1;
                            }

                            Navigator.of(context).push(
                              _createRoute(userData,totalAmount),
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

  Route _createRoute(userData,totalAmount) {
    return PageRouteBuilder(
      transitionDuration : const Duration(milliseconds: 1000),
      pageBuilder: (context, animation, secondaryAnimation) => PreviewScreen(
        userData: userData,
        listInvoiceData: Constants.listInvoiceData,
        subTotal: totalAmount,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
