import 'package:flutter/material.dart';


// copilet code try it
class PurchaseEndDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pop(true);
    });

    return AlertDialog(
      title: Text('Purchase Complete'),
      content: Text('Thank you for your purchase!'),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

void showPurchaseEndDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return PurchaseEndDialog();
    },
  );
}
