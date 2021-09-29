import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'test.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Test obj = Test(name: "Roshan");
  TextEditingController ctext = TextEditingController();
  String result = "";

  void translateToNepali() {
    final translator = GoogleTranslator();
    translator.translate(ctext.text, from: 'en', to: 'ne').then((s) {
      setState(() {
        result = s.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("English - Nepali"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            TextField(
              controller: ctext,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.orange),
              width: 160,
              height: 50,
              child: MaterialButton(
                  onPressed: () {
                    translateToNepali();
                  },
                  child: const Text(
                    "Translate",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            const SizedBox(height: 20),
            Text(
              result == "" ? "" : "The Result is: $result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
