import 'package:flutter/material.dart';
import 'package:flutter_finance_app/add_screen.dart';
import 'package:flutter_finance_app/home.dart';
import 'package:flutter_finance_app/statistics.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index_color = 0;

  List screen=[Home(),StatisticState(),Home(),StatisticState()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index_color],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        backgroundColor: Color(0xff368983),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    index_color = 0;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.home,
                    size: 30,
                    color: index_color == 0 ? Color(0xff368983) : Colors.grey,
                  )),
              GestureDetector(
                  onTap: () {
                    index_color = 1;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                    color: index_color == 1 ? Color(0xff368983) : Colors.grey,
                  )),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                  onTap: () {
                    index_color = 2;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.account_balance_wallet,
                    size: 30,
                    color: index_color == 2 ? Color(0xff368983) : Colors.grey,
                  )),
              GestureDetector(
                  onTap: () {
                    index_color = 3;
                    setState(() {});
                  },
                  child: Icon(
                    Icons.person_outline,
                    size: 30,
                    color: index_color == 3 ? Color(0xff368983) : Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
