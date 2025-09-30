import 'package:flutter/material.dart';
import 'package:vendingmachine_app/payment/payment.dart';
import 'package:vendingmachine_app/resupply/Item.dart';
import 'package:vendingmachine_app/showresult.dart';

import 'designGUI.dart';

//หน้ายืนยันซื้อ
class ConfirmPurchase extends StatelessWidget {
  const ConfirmPurchase({super.key, required this.item});

  final Item item;

  Widget build(BuildContext context) {
    return item.stockLeft > 0 ? haveStock(context) : noStock(context);
  }
  //หน้ากรณีมีของ
  Widget haveStock(BuildContext context) {
    return AlertDialog(
      title: Text("ยืนยันการซื้อของ"),
      content: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(20),
          width: 300,
          height: 300,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage(item.image),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text(item.name),
              Text("${item.price.toString()} ฿"),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(//ปุ่มยืนยันซื้อของ
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.green),
          ),
          child: const Text('ยืนยัน', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pop();
              if (sum - item.price < 0) {//ถ้าเงินเหลือในตู้ไม่พอจะซื้อของชิ้นนี้ จะไปหน้า payment
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(item: item),
                  ),
                );
              } else {// ถ้ามีเงินเหลือเท่ากับสินค้าหรือมากกว่า จะซื้อของทันที
                sum -= item.price;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Showresult(item:item,)),
                );
              }
          },
        ),
        TextButton(//ปุ่มยกเลิกซื้อของ
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(Colors.red),
          ),
          child: const Text('ยกเลิก', style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
  //หน้าเวลากรณีของหมด
  Widget noStock(BuildContext context) {
    return AlertDialog(
      title: Text("สินค้าชิ้นนี้ยังไม่มีของ"),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red),
            ),
            child: const Text(
              'ย้อนกลับ',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}