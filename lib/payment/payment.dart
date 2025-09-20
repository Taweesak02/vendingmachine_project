import 'package:flutter/material.dart';
import 'package:vendingmachine_app/moneyleft.dart';
import 'package:vendingmachine_app/showresult.dart';
import '../Item.dart';
import 'cashpayment.dart';
import 'digitalpayment.dart';

double sum = 0;

class Payment extends StatefulWidget {
  const Payment({super.key, required this.item});
  final Item item;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  double size = 300;

  Widget build(BuildContext context) {
    List<Widget> paymentOptions() => [
      SizedBox(
        width: size,
        height: size,
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              Navigator.of(context).pop();
              if (sum - widget.item.price < 0) {
                print(sum);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CashPayment(item: widget.item),
                  ),
                );
              } else {
                sum -= widget.item.price;
                print(sum);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Showresult()),
                );
              }
            },
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.wallet, size: 80), Text("เงินสด")],
            ),
          ),
        ),
      ),
      SizedBox(
        width: size,
        height: size,
        child: Card(
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DigitalPayment()),
              );
            },
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android, size: 80),
                Text("จ่ายด้วยธนาคาร"),
              ],
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("ชำระเงิน")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("เลือกวิธีการชำระเงิน", textScaler: TextScaler.linear(1.5)),
              MediaQuery.of(context).size.width > 600
                  ? Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: paymentOptions(),
                  )
                  : Column(spacing: 20, children: paymentOptions()),
              MoneyLeft(),
            ],
          ),
        ),
      ),
    );
  }
}
