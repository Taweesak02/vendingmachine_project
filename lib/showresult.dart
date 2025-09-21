import 'package:flutter/material.dart';
import 'package:vendingmachine_app/designGUI.dart';
import 'resupply/Item.dart';

class Showresult extends StatefulWidget {
  const Showresult({super.key, required this.item});

  final Item item;

  @override
  State<Showresult> createState() => _ShowresultState();
}

class _ShowresultState extends State<Showresult> {
  void initState() {
    super.initState();
    widget.item.decrease();
    print(widget.item.stockLeft);
  }

  Widget build(BuildContext context) {
    Widget backBT(BuildContext context, String title) {
      return ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text(title),
      );
    }

    return PopScope(
      onPopInvoked: (didPop) {
        isrefresh.value = true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("เสร็จสิ้นการชำระ")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text(
                    "ชำระเสร็จสิ้น",
                    textScaler:
                        MediaQuery.of(context).size.width > 600
                            ? TextScaler.linear(5)
                            : TextScaler.linear(3),
                    style: TextStyle(color: Colors.green),
                  ),
                  Text("กรุณารับสินค้า", textScaler: TextScaler.linear(2)),
              
                  Image(image: AssetImage(widget.item.image), height: 400),
                  Text("เงินคงเหลือ $sum บาท"),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        sum > 0
                            ? Row(
                              spacing: 30,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ShowWithdrawn(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'คืนเงิน',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                backBT(context, 'ซื้อสินค้าต่อ'),
                              ],
                            )
                            : backBT(context, "เสร็จสิ้น"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShowWithdrawn extends StatelessWidget {
  const ShowWithdrawn({super.key});

  Widget build(BuildContext context) {
    double withdrawnprice = sum;
    sum = 0;
    return Scaffold(
      appBar: AppBar(title: Text("การคืนเงิน")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "คืนเงินเสร็จสิ้น",
                textScaler:
                    MediaQuery.of(context).size.width > 600
                        ? TextScaler.linear(5)
                        : TextScaler.linear(3),
                style: TextStyle(color: Colors.green),
              ),
              Text("คืนเงินทั้งหมด $withdrawnprice บาท"),
              Padding(
                padding: const EdgeInsets.only(top: 300),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "เสร็จสิ้น",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
