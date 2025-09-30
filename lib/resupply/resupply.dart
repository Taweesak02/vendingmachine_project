import 'package:flutter/material.dart';
import 'package:vendingmachine_app/home/designGUI.dart';
import 'Item.dart';

//หน้าเติมของในเครื่อง
class Resupply extends StatefulWidget {
  const Resupply({super.key});

  @override
  State<Resupply> createState() => _ResupplyState();
}

class _ResupplyState extends State<Resupply> {
  Widget build(BuildContext) {
    return PopScope(// ออกจากหน้าทำคำสั่ง
      onPopInvoked: (didPop) {
        isrefresh.value = true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("การเติมสินค้า")),
        body: ListView(
          children:
              itemsInVendingMachine.values
                  .map((item) => ListItem(item))
                  .toList(),
        ),
      ),
    );
  }
  //แสดงของทุกชิ้น
  Widget ListItem(Item item) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(item.stockLeft.toString())),
        title: Text(item.name),
        subtitle: Text("ราคา ${item.price.toString()} บาท"),
        trailing: ElevatedButton(
          onPressed: () {
            setState(() {
              item.addsupply();
            });
          },
          child: Text("เติมสินค้า"),
        ),
      ),
    );
  }
}

class ShowResupplyBT extends StatelessWidget {//ปุ่มเข้าหน้า restock
  const ShowResupplyBT({super.key});

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(context: context, builder: (context) => Resupply());
      },
      child: Icon(Icons.key),
    );
  }
}
