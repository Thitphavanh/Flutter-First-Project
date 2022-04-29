import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({Key? key}) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  // ຕຳແໜ່ງສຳລັບເກັບຂໍ້ມູນຂອງຄ່າທີ່ User ພິມໃສ່
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  // double price = 15000;
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    super.initState();
    result.text =
        'Phenomenal Logistic ຂົນສົ່ງຈີນ - ລາວ\nຄ່າຂົນສົ່ງກິໂລ 15,000 ກີບ\nຈຳນວນ x ກິໂລ\nລວມທັງໝົດທີ່ລູກຄ້າຕ້ອງຈ່າຍ x LAK';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Center(
            child: Column(
              children: [
                buildImage(),
                const SizedBox(height: 20),
                buildText(),
                const SizedBox(height: 20),
                buildPriceField(),
                const SizedBox(height: 20),
                buildQuantityField(),
                const SizedBox(height: 20),
                buildButton(),
                const SizedBox(height: 20),
                buildTextRusult(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text buildTextRusult() {
    return Text(
      result.text,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    );
  }

  ElevatedButton buildButton() {
    return ElevatedButton(
      onPressed: () {
        var calculate = double.parse(quantity.text) * double.parse(price.text);
        print('Product quantity ${quantity.text} Total : $calculate LAK');
        setState(() {
          result.text =
              'Phenomenal Logistic ຂົນສົ່ງຈີນ - ລາວ\nຄ່າຂົນສົ່ງກິໂລ 15,000 ກີບ\nຈຳນວນ ${quantity.text} ກິໂລ\nລວມທັງໝົດທີ່ລູກຄ້າຕ້ອງຈ່າຍ ${calculate.toStringAsFixed(2)} LAK';
        });
      },
      child: const Text('ຄິດໄລ່'),
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 20,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.red.shade300,
        ),
      ),
    );
  }

  Widget buildPriceField() {
    return TextField(
      controller: price,
      decoration: InputDecoration(
        hintText: 'ລາຄາຂົນສົ່ງ : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget buildQuantityField() {
    return TextField(
      controller: quantity,
      decoration: InputDecoration(
        hintText: 'ຈຳນວນກິໂລ : ',
        hintStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget buildText() {
    return const Text(
      'calculate',
      style: TextStyle(fontSize: 30, color: Colors.red),
    );
  }

  Widget buildImage() {
    return Image.asset(
      'assets/phenomenal_logistic2.jpg',
    );
  }
}
