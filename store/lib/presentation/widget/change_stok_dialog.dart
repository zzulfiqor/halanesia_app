import 'package:core/core.dart';
import 'package:flutter/material.dart';

Future changeStockDialog(BuildContext context, String productId, int stock,
    Function(int productId, int stock) onPressed) {
  var stockValue = stock;

  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (context) {
      double modalHeight = MediaQuery.of(context).size.height * 0.5;
      double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

      return SizedBox(
        height: true ? modalHeight + keyboardHeight : modalHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text('Ubah Stok', style: header)
              ],
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Ubah Stok', style: header),
                  SizedBox(
                    width: 80,
                    height: 42,
                    child: TextFormField(
                        initialValue: stock.toString(),
                        onChanged: (value) {
                          stockValue = int.parse(value);
                        },
                        autocorrect: false,
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                            hintText: "0",
                            border: OutlineInputBorder(),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 11))),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ButtonSolidBlue(
                text: 'Simpan',
                onPressed: () {
                  onPressed(int.parse(productId), int.parse(stockValue.toString()));
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
    },
    isScrollControlled: true,
  );
}
