// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:vendingmachine_app/moneyleft.dart';
import 'package:vendingmachine_app/payment/payment.dart';
import 'package:vendingmachine_app/resupply/resupply.dart';
import 'resupply/Item.dart';
import 'showresult.dart';

final ValueNotifier<bool> isrefresh = ValueNotifier(false);
double sum = 0;

class VendingMachineGUI extends StatefulWidget {
  const VendingMachineGUI({super.key});

  @override
  State<VendingMachineGUI> createState() => _VendingMachineGUIState();
}

class _VendingMachineGUIState extends State<VendingMachineGUI> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vending Machine"),
        actionsPadding: EdgeInsets.all(10),
        actions: [
          ShowResupplyBT(),
          SizedBox(width: 10),
          ShowMoneyLeftDialogue(),
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

class _ItemDisplayState extends State<ItemDisplay> {
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => ConfirmPurchase(item: widget.item),
          );
        },
        child: ValueListenableBuilder(
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

class ConfirmPurchase extends StatelessWidget {
  const ConfirmPurchase({super.key, required this.item});

  final Item item;

  Widget build(BuildContext context) {
    return item.stockLeft > 0 ? haveStock(context) : noStock(context);
  }

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
        TextButton(
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
            // Navigator.of(context).pop();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Payment(item: item)),
            // );
            Navigator.of(context).pop();
              if (sum - item.price < 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(item: item),
                  ),
                );
              } else {
                sum -= item.price;
                print(sum);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Showresult(item:item,)),
                );
              }
          },
        ),
        TextButton(
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
