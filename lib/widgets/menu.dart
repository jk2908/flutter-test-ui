import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  'Crossword 001',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  tooltip: 'Close menu',
                  onPressed: () => {Navigator.of(context).pop()},
                ),
              ])),
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text('Reset'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.help_outline_rounded),
            title: Text('Help'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.print_rounded),
            title: Text('Print'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
