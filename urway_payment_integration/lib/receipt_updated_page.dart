// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:urway_payment_integration/resp_data_model.dart';


class ReceiptUpdatedPage extends StatefulWidget {
  final String respFinalData;
  // ignore: use_key_in_widget_constructors
  const ReceiptUpdatedPage(this.respFinalData);

  @override
  // ignore: library_private_types_in_public_api
  _MyReceiptPage createState() => _MyReceiptPage();
}

class _MyReceiptPage extends State<ReceiptUpdatedPage> {
  late Map<String, dynamic> mapResp;
  bool visibilityToken = false;
  List list = [];
  Map<String, String> mapData = {};
  late String myData;

  void _visibleDataList() {
    setState(() {
      var dataSp = widget.respFinalData.split(',');
      print(widget.respFinalData);

      for (var element in dataSp) {
        mapData[element.split(':')[0]] = element.split(':')[1];
      }
      print(mapData.keys);

      // mapResp = widget.respFinalData;
      mapData
          .forEach((k, v) => list.add(RespDataModel(resKey: k, resValue: v)));
      print(list);
    });
  }

  String getstrfromList(String strlistrowvalue) {
    myData = strlistrowvalue.replaceAll(RegExp('[{}]'), '');
    print('hello $myData');
    return myData;
  }

  //}

  @override
  void initState() {
    super.initState();
    _visibleDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urway Receipt Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: tableBody(
              context,
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView tableBody(BuildContext ctx) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 50,
          dividerThickness: 5,
          columns: const [
            DataColumn(
              label: Text(
                "Key",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is First Name",
            ),
            DataColumn(
              label: Text(
                "Values",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                ),
              ),
              numeric: false,
              tooltip: "This is Values",
            ),
          ],
          rows: list
              .map(
                (list) => DataRow(cells: [
                  DataCell(
                    Text(getstrfromList(list.resKey)),
                  ),
                  DataCell(
                    Text(getstrfromList(list.resValue)),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
