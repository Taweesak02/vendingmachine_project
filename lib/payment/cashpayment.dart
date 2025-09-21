import 'package:flutter/material.dart';
import 'package:vendingmachine_app/payment/money.dart';
import 'package:vendingmachine_app/showresult.dart';
import '../designGUI.dart';
import '../resupply/Item.dart';

class CashPayment extends StatefulWidget {
  const CashPayment({super.key, required this.item});

  final Item item;

  @override
  State<CashPayment> createState() => _CashPaymentState();
}

class _CashPaymentState extends State<CashPayment> {
  double targetmoney = 0;
  double inputmoney = 0;
  bool paymentCompleted = false;
  @override
  void initState() {
    super.initState();

    targetmoney = widget.item.price - sum;
    checkSum();
  }

  void checkSum() {
    if (targetmoney <= 0) {
      if (targetmoney < 0) {
        //จ่ายเกิน
        sum += targetmoney * -1;
      }else{
        sum = 0;
      }
      
      paymentCompleted = true;
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Showresult(item: widget.item)),
      );
      print(sum);
    }
  }

  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (!paymentCompleted) {
          sum += inputmoney;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text("ชำระด้วยเงินสด")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  spacing: 50,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [displayMoney(), inputCash(), moneyOption()],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget displayMoney() {
    return Container(
      padding: EdgeInsets.all(50),
      width: 400,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 50,
        children: [
          Text("ต้องจ่ายเงินอีก", textScaler: TextScaler.linear(1.5)),
          Text(targetmoney.toString(), textScaler: TextScaler.linear(1.5)),
        ],
      ),
    );
  }

  Widget inputCash() {
    return Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 5,
          color: const Color.fromRGBO(66, 66, 66, 1),
        ),
      ),
      width: 400,
      child: Column(spacing: 20, children: [cashType(), coinType()]),
    );
  }

  DragTarget<Money> cashType() {
    return DragTarget(
      onAcceptWithDetails: (money) {
        setState(() {
          if (money.data.iscash) {
            inputmoney += money.data.value;
            targetmoney -= money.data.value;
            checkSum();
          }
        });
      },
      builder:
          (context, candidateData, rejectedData) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: const Color.fromRGBO(66, 66, 66, 1),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 300,
                    height: 10,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 50,
                  color: Colors.grey[600],
                ),
                Text("ช่องใส่ธนบัตร", textScaler: TextScaler.linear(1.5)),
              ],
            ),
          ),
    );
  }

  DragTarget<Money> coinType() {
    return DragTarget(
      onAcceptWithDetails: (money) {
        setState(() {
          if (!money.data.iscash) {
            inputmoney += money.data.value;
            targetmoney -= money.data.value;
            checkSum();
          }
        });
      },
      builder:
          (context, candidateData, rejectedData) => Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: const Color.fromRGBO(66, 66, 66, 1),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 8,
                    height: 70,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 50,
                  color: Colors.grey[600],
                ),
                Text("ช่องใส่เหรียญ", textScaler: TextScaler.linear(1.5)),
              ],
            ),
          ),
    );
  }

  Widget moneyOption() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
        ),
        child: Row(
          spacing: 10,
          children: [
            draggableCash(
              Money(value: 1, image: moneyimage[0], iscash: false),
              Colors.grey,
            ),
            draggableCash(
              Money(value: 2, image: moneyimage[1], iscash: false),
              Colors.yellow,
            ),
            draggableCash(
              Money(value: 5, image: moneyimage[2], iscash: false),
              Colors.grey,
            ),
            draggableCash(
              Money(value: 10, image: moneyimage[3], iscash: false),
              Colors.grey,
            ),
            draggableCash(
              Money(value: 20, image: moneyimage[4], iscash: true),
              Colors.green,
            ),
            draggableCash(
              Money(value: 50, image: moneyimage[5], iscash: true),
              Colors.blue,
            ),
            draggableCash(
              Money(value: 100, image: moneyimage[6], iscash: true),
              Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Draggable<Money> draggableCash(Money money, Color color) {
    return Draggable(
      data: money,
      feedback: Transform.rotate(
        origin: money.iscash ? Offset(-140, -80) : Offset(10, 0),
        angle: 3.14 / 2,
        child: Image(
          image: AssetImage(money.image),
          width: money.iscash ? 400 : 80,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black, width: 4),
        ),
        width: 50,
        height: 50,
        child: Align(
          alignment: Alignment.center,
          child: Text(money.value.toString()),
        ),
      ),
    );
  }
}
