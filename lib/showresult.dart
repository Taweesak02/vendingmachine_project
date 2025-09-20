import 'package:flutter/material.dart';

class Showresult extends StatelessWidget {
  const Showresult({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("เสร็จสิ้นการชำระ")),
      body: Column(
        children: [
          Text("ชำระเสร็จสิ้น"),
          Text("กรุณารับสินค้า"),
        ]
      ),
    );
  }
}

class ShowWithdrawn extends StatelessWidget {
  const ShowWithdrawn({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("การคืนเงิน"),),
      body: Column(

      ),
    );
  }
}
