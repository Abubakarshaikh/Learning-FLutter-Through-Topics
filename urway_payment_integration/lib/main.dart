import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:urwaypayment/urwaypayment.dart';

import 'receipt_updated_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await _performtrxn(context, "hosted");
          },
          child: const Text("Payment"),
        ),
      ),
    );
  }

  Future<void> _performtrxn(BuildContext context, String transType) async {
    var lastResult = "";
    var decodeSucceeded = false;
    if (transType == "hosted") {
      // on Apple Click call other method  check with if else
      lastResult = await Payment.makepaymentService(
        context: context,
        metadata: '',
        country: "SA",
        action: "1",
        currency: "SAR",
        amt: "1.00",
        customerEmail: "john.deo@gmail.com",
        trackid: "111AAA",
        udf1: "",
        udf2: "",
        udf3: "",
        udf4: "",
        udf5: "",
        cardToken: "",
        address: "ABC",
        city: "PQR",
        state: "XYZ",
        tokenizationType: "0",
        zipCode: "",
        tokenOperation: "A/U/D",
        // metadata: "{Entry1:value1,entry2:value2,entryN:valueN}"
      );

      print('Result in Main is $lastResult');

      // convert the result coming from the sdk into json
      String resultWithoutCurlyBracket =
          lastResult.replaceAll(RegExp('[{}]'), '');
      print('check if we remove the curly bracket $resultWithoutCurlyBracket');
      var sp = resultWithoutCurlyBracket.split(',');
      print('from the main file : $sp');
      // converting it the string to an object
      Map<String, String> mapData = {};
      for (var element in sp) {
        mapData[element.split(':')[0]] = element.split(':')[1];
      }

      // convertign the object to json
      var encoded = jsonEncode(mapData);
      print('to json $encoded');
      decodeSucceeded = true;
    } else if (transType == "applepay") {
      print("In apple pay");
      // lastResult = await Payment.makeapplepaypaymentService(
      //     context: context,
      //     country: "SA",
      //     action: "1",
      //     currency: "SAR",
      //     amt: "1.00",
      //     customerEmail: "john@gmail.com",
      //     trackid: "111AA",
      //     udf1: "",
      //     udf2: "",
      //     udf3: "",
      //     udf4: "",
      //     udf5: "",
      //     tokenizationType: "1",
      //     merchantIdentifier: "merchant.urwaytech.applepay",
      //     shippingCharge: "0.00",
      //     companyName: "hello");
      print('Result on Apple Pay in Main is $lastResult');
      decodeSucceeded = true;
    }

    if (decodeSucceeded) {
      if (lastResult.isNotEmpty) {
        print('Show');
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ReceiptUpdatedPage(lastResult)));
      } else {
        print('Show Blank Data');
      }
    }
    print('Payment $lastResult');
  }
}
