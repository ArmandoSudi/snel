import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum DialogAction { yes, abort }

class ShowAlertDialog {
  // static Future<DialogAction?> yesAbortDialog(
  static Future<Widget> yesAbortDialog(
      BuildContext context,
      // String title,
      String body,
      ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
          title: const Text('Alert !'),
          content: Text(body),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    return (action != null) ? action : DialogAction.abort;
  }
}