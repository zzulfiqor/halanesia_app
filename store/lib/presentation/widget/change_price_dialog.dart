import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';

Future changePriceDialog(
    {required BuildContext context,
    required String id,
    required int price,
    required Function(String id, int price) onPressed}) {
  final CurrencyTextInputFormatter productPrice = CurrencyTextInputFormatter(
    symbol: 'Rp ',
    decimalDigits: 0,
  );

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
                Text('Ubah Harga', style: header)
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 299,
              height: 42,
              child: TextFormField(
                  initialValue: formatCurrencyWithDecimal(price),
                  inputFormatters: <TextInputFormatter>[productPrice],
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  maxLines: 1,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                      hintText: "Masukkan harga",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 11))),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ButtonSolidBlue(
                text: 'Simpan',
                onPressed: () {
                  var price = productPrice
                      .getUnformattedValue()
                      .toStringAsFixed(0)
                      .replaceIfEmptyOrNull('0');
                  onPressed(id, int.parse(price));
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
