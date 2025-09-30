import 'package:flutter/material.dart';
import 'package:vendingmachine_app/moneyleft.dart';
import 'package:vendingmachine_app/resupply/resupply.dart';

import '../resupply/Item.dart';
import 'confirmpurchase.dart';

final ValueNotifier<bool> isrefresh = ValueNotifier(false);//ตรวจเมื่อเข้ามาหน้าจอนี้จะเป็นค่า true เพื่อ refesh ui
double sum = 0;

class VendingMachineGUI extends StatefulWidget {
  const VendingMachineGUI({super.key});

  @override
  State<VendingMachineGUI> createState() => _VendingMachineGUIState();
}
//หน้าหลักตู้
class _VendingMachineGUIState extends State<VendingMachineGUI> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vending Machine"),
        actionsPadding: EdgeInsets.all(10),
        actions: [
          Tooltip(message: "เติมสินค้า" ,child: ShowResupplyBT()),
          SizedBox(width: 10),
          Tooltip(message: "เงินคงเหลือ",child: ShowMoneyLeftDialogue()),
        ],
      ),
      body: Container(
        color: Colors.purpleAccent,
        child: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 300).toInt(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.8,
          children:
              itemsInVendingMachine.values
                  .map((item) => ItemDisplay(item: item))
                  .toList(),
        ),
      ),
    );
  }
}

class ItemDisplay extends StatefulWidget {
  const ItemDisplay({super.key, required this.item});

  final Item item;

  @override
  State<ItemDisplay> createState() => _ItemDisplayState();
}
//แสดงสินค้า จำนวนของ ราคาของ
class _ItemDisplayState extends State<ItemDisplay> {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(//แสดงหน้ายืนยันการซื้อสินค้า
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ConfirmPurchase(item: widget.item),
          );
        },
        child: ValueListenableBuilder(//ตรวจ isrefresh เมื่อ เป็น true จะ refresh ui
          valueListenable: isrefresh,
          builder: (context, value, child) {
            isrefresh.value = false;
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Ink.image(
                            image: AssetImage(widget.item.image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color:
                                  widget.item.stockLeft > 0
                                      ? Colors.green[400]
                                      : Colors.red[400],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.item.stockLeft > 0
                                  ? widget.item.stockLeft.toString()
                                  : "หมด",
                              textAlign: TextAlign.center,
                              textScaler: TextScaler.linear(1.3),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(widget.item.name),
                        Text("${widget.item.price.toString()} ฿"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

