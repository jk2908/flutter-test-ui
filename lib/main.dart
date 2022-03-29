// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '/widgets/menu.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

const MaterialColor black = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0x00000000),
    100: const Color(0x00000000),
    200: const Color(0x00000000),
    300: const Color(0x00000000),
    400: const Color(0x00000000),
    500: const Color(0x00000000),
    600: const Color(0x00000000),
    700: const Color(0x00000000),
    800: const Color(0x00000000),
    900: const Color(0x00000000),
  },
);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Marmalade Test App',
      theme: ThemeData(
        primarySwatch: white,
      ),
      home: Scaffold(
          drawer: Menu(),
          key: _drawerKey,
          body: Container(
              color: Colors.white,
              constraints: const BoxConstraints.expand(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  header(),
                  game(),
                  keyboard(),
                ],
              ))),
    );
  }

  Widget header() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1.0,
          color: Color.fromARGB(255, 196, 196, 196),
        )),
      ),
      padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    tooltip: 'Close',
                    onPressed: () {},
                  ),
                  SizedBox(width: 25),
                  Text(' 00:00 '),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CheckMenu(),
                  SizedBox(width: 25),
                  RevealMenu(),
                  SizedBox(width: 25),
                  IconButton(
                    icon: Icon(Icons.settings_cell_outlined),
                    tooltip: 'More options',
                    onPressed: () {
                      _drawerKey.currentState!.openDrawer();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget game() {
    return Container(
      //constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
      ),
      height: 100,
      width: 100,
      child: Text(' Game '),
    );
  }

  Widget keyboard() {
    return Container(
      constraints: BoxConstraints(minWidth: double.infinity),
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
          width: 1.0,
          color: Color.fromARGB(255, 196, 196, 196),
        )),
      ),
      padding: const EdgeInsets.fromLTRB(50, 50, 50, 50),
      child: Column(
        children: [
          Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 290),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  notesToggle(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      keyButton('Un'),
                      const SizedBox(width: 2.5),
                      keyButton('Re'),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 3.0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 290),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  keyButton('1'),
                  keyButton('2'),
                  keyButton('3'),
                  keyButton('4'),
                  keyButton('5'),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 290),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    keyButton('6'),
                    keyButton('7'),
                    keyButton('8'),
                    keyButton('9'),
                    keyButton('Del'),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget keyButton(id) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(50, 50),
        primary: Colors.black,
        side: BorderSide(width: 1.0, color: Color.fromARGB(255, 196, 196, 196)),
      ),
      onPressed: () {},
      child: Text('$id'),
    );
  }

  Widget notesToggle() {
    return ToggleSwitch(
        activeBgColor: [Color.fromARGB(245, 216, 124, 70)],
        activeFgColor: Colors.white,
        borderColor: [Color.fromARGB(255, 196, 196, 196)],
        borderWidth: 1.0,
        cornerRadius: 3.0,
        inactiveBgColor: Colors.white,
        initialLabelIndex: 0,
        labels: ['Notes', 'Normal'],
        minHeight: 47.0,
        minWidth: 85,
        totalSwitches: 2,
        onToggle: (index) {
          print('switched to: $index');
        });
  }
}

class CheckMenu extends StatelessWidget {
  const CheckMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.check),
      tooltip: 'Check grid',
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
                height: 290,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Check',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          tooltip: 'Close menu',
                          onPressed: () => {Navigator.of(context).pop()},
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 196, 196, 196),
                        )),
                      ),
                      child: Material(
                          child: ListTile(
                        title: const Text('Check cell',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        onTap: () => {Navigator.of(context).pop()},
                      ))),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 196, 196, 196),
                        )),
                      ),
                      child: Material(
                          child: ListTile(
                        title: const Text('Check word',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        onTap: () => {Navigator.of(context).pop()},
                      ))),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 196, 196, 196),
                        )),
                      ),
                      child: Material(
                          child: ListTile(
                        title: const Text('Check grid',
                            style: TextStyle(fontSize: 14)),
                        contentPadding:
                            const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        onTap: () => {Navigator.of(context).pop()},
                      ))),
                ]));
          },
        );
      },
    );
  }
}

class RevealMenu extends StatelessWidget {
  const RevealMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search_rounded),
      tooltip: 'Reveal',
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 200,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Modal BottomSheet'),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
