import 'package:flutter/material.dart';
import 'package:insta/api.dart';
import 'package:insta/button.dart';
import 'package:insta/textfield.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shotz Exe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'By: Officialenvysmm'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StringWrapper? username = StringWrapper(), amount = StringWrapper(); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        backgroundColor: Colors.purple[700],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical : 50.0, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Username',
            ),
            SizedBox(height: 10,),
            MyTextField(
              hintText: 'Username',
              inputType: TextInputType.name,
              onChanged: username,
            ),
            SizedBox(height: 20,),
            const Text(
              'Amount of requests',
            ),
            SizedBox(height: 10,),
            MyTextField(
              hintText: 'Amount',
              inputType: TextInputType.number,
              onChanged: amount,
            ),
            SizedBox(height: 28,),
            Center(
              child: MyTextButton(
                bgColor: Colors.black,
                textColor: Colors.white,
                buttonName: 'BAN USER',
                onTap: () async {
                  Api api = Api();
                  api.request(username!.value, amount!.value);
                },
                ),
            )
          ],
        ),
      ),
    );
  }
}
