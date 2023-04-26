
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app todo/appToDo.dart';
import 'calc.dart';
import 'kids.dart';
import 'kids_review.dart';

main()=>runApp(myApp());

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: kids(),
      debugShowCheckedModeBanner: false,
    );
  }
}

