import 'package:flutter/material.dart';

class BasicScreen extends StatelessWidget {
  const BasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Screen"),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text("Ini Body")),
            // Container(
            //     // width: 100,
            //     // height: 100,
            //     color: Colors.cyan,
            //     padding: const EdgeInsets.all(16),
            //     // margin: const EdgeInsets.all(16),
            //     child: Text("Ini Body",
            //       style: TextStyle(color: Color(0x656C1393)),
            //     )),
            // Container(
            //   // width: 100,
            //   // height: 100,
            //     color: Colors.cyan,
            //     // padding: const EdgeInsets.all(16),
            //     margin: const EdgeInsets.all(16),
            //     child: Text("Ini Body",
            //       style: TextStyle(color: Color(0x656C1393)),
            //     )),
            Expanded(child: Text("Ini Body")),
            Flexible(child: Text("Ini Body")),
          ],
        ),
      )
    );
  }
}


