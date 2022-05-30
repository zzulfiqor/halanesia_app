class GeneratePaymentUrlResponseDataCustomer {
/*
{
  "email": "sg8.dian@gmail.com",
  "name": "Dian",
  "address": "Telukan RT.3 RW.9 Telukan Grogol Sukoharjo Jawa Tengah",
  "country": "ID"
} 
*/

  String? email;
  String? name;
  String? address;
  String? country;

  GeneratePaymentUrlResponseDataCustomer({
    this.email,
    this.name,
    this.address,
    this.country,
  });
  GeneratePaymentUrlResponseDataCustomer.fromJson(Map<String, dynamic> json) {
    email = json['email']?.toString();
    name = json['name']?.toString();
    address = json['address']?.toString();
    country = json['country']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['address'] = address;
    data['country'] = country;
    return data;
  }
}

class GeneratePaymentUrlResponseDataPayment {
/*
{
  "payment_method_types": [
    "VIRTUAL_ACCOUNT_BCA"
  ],
  "payment_due_date": 15,
  "token_id": "164657029520223706193743092",
  "url": "https://sandbox.doku.com/checkout/link/164657029520223706193743092",
  "expired_date": "20220306195238"
} 
*/

  List<String?>? paymentMethodTypes;
  int? paymentDueDate;
  String? tokenId;
  String? url;
  String? expiredDate;

  GeneratePaymentUrlResponseDataPayment({
    this.paymentMethodTypes,
    this.paymentDueDate,
    this.tokenId,
    this.url,
    this.expiredDate,
  });
  GeneratePaymentUrlResponseDataPayment.fromJson(Map<String, dynamic> json) {
  if (json['payment_method_types'] != null) {
  final v = json['payment_method_types'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    paymentMethodTypes = arr0;
    }
    paymentDueDate = json['payment_due_date']?.toInt();
    tokenId = json['token_id']?.toString();
    url = json['url']?.toString();
    expiredDate = json['expired_date']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (paymentMethodTypes != null) {
      final v = paymentMethodTypes;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['payment_method_types'] = arr0;
    }
    data['payment_due_date'] = paymentDueDate;
    data['token_id'] = tokenId;
    data['url'] = url;
    data['expired_date'] = expiredDate;
    return data;
  }
}

class GeneratePaymentUrlResponseData {
/*
{
  "invoice_number": "INV-2022-03-06T12:37:38Z-37",
  "currency": "IDR",
  "payment": {
    "payment_method_types": [
      "VIRTUAL_ACCOUNT_BCA"
    ],
    "payment_due_date": 15,
    "token_id": "164657029520223706193743092",
    "url": "https://sandbox.doku.com/checkout/link/164657029520223706193743092",
    "expired_date": "20220306195238"
  },
  "customer": {
    "email": "sg8.dian@gmail.com",
    "name": "Dian",
    "address": "Telukan RT.3 RW.9 Telukan Grogol Sukoharjo Jawa Tengah",
    "country": "ID"
  }
} 
*/

  String? invoiceNumber;
  String? currency;
  GeneratePaymentUrlResponseDataPayment? payment;
  GeneratePaymentUrlResponseDataCustomer? customer;

  GeneratePaymentUrlResponseData({
    this.invoiceNumber,
    this.currency,
    this.payment,
    this.customer,
  });
  GeneratePaymentUrlResponseData.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoice_number']?.toString();
    currency = json['currency']?.toString();
    payment = (json['payment'] != null) ? GeneratePaymentUrlResponseDataPayment.fromJson(json['payment']) : null;
    customer = (json['customer'] != null) ? GeneratePaymentUrlResponseDataCustomer.fromJson(json['customer']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['invoice_number'] = invoiceNumber;
    data['currency'] = currency;
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

