import 'package:flutter/material.dart';
import 'package:vendingmachine_app/home/designGUI.dart';
import 'package:vendingmachine_app/showresult.dart';
import '../resupply/Item.dart';
//หน้าสแกนจ่าย
class DigitalPayment extends StatelessWidget {
  const DigitalPayment({super.key, required this.item});

  final Item item;

  Widget build(BuildContext context) {
    double targetmoney = item.price - sum;

    return Scaffold(
      appBar: AppBar(title: Text("ชำระด้วยการสแกนจ่าย")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("กรุณาแสกนจ่าย"),
              Text("ยอดชำระรวม ${targetmoney} บาท"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 50,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      sum = 0;
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Showresult(item: item),
                        ),
                      );
                    },
                    child: Text("จ่ายเงิน"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ย้อนกลับ"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
