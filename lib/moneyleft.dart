import 'package:flutter/material.dart';
import 'package:vendingmachine_app/showresult.dart';
import 'designGUI.dart';

class MoneyLeft extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("เงินเหลือค้าง", textScaler: TextScaler.linear(1.3)),
            Text('${sum.toString()} บาท'),
          ],
        ),
      ),
    );
  }
}

class ShowMoneyLeftDialogue extends StatelessWidget {
  const ShowMoneyLeftDialogue({super.key});

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (context) => Dialogue(context));
      },
      child: Icon(Icons.wallet),
    );
  }

  Widget Dialogue(BuildContext context) {
    return AlertDialog(
      title: Text("ยอดคงเหลือทั้งหมด"),
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("ตอนนี้มีเงินคงเหลืออยู่ในตู้"),
            Text('${sum.toString()} บาท'),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            if (sum > 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowWithdrawn()),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(title: Text("เงินคงเหลือไม่มีอยู่แล้ว"));
                },
              );
            }
          },
          child: Text("คืนเงิน", style: TextStyle(color: Colors.white)),
        ),
         ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("ย้อนกลับซื้อของ"),
        ),
      ],
    );
  }
}
