import 'package:flutter/material.dart';
import 'package:flutter_finance_app/model/money.dart';
import 'package:flutter_finance_app/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 340, child: Header()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction History",
                      style: buildTextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 19),
                    ),
                    Text(
                      "See All",
                      style: buildTextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(childCount: getData().length, (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset("$imageAsset${getData()[index].image}"),
                ),
                title: Text(
                  getData()[index].name!,
                  style: buildTextStyle(color: Colors.black, fontSize: 16),
                ),
                subtitle: Text(
                  getData()[index].time!,
                  style: buildTextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
                ),
                trailing: Text(
                  "\$ "+getData()[index].fee!,
                  style: buildTextStyle(color:getData()[index].buy ? Colors.green:Colors.red, fontSize: 14),
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                  color: Color(0xff388983),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20.0), bottomRight: Radius.circular(20.0))),
              child: Stack(
                children: [
                  Positioned(
                      top: 30,
                      right: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Color.fromRGBO(250, 250, 250, 0.1),
                          child: Icon(
                            Icons.notification_add_outlined,
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: buildTextStyle(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Md. Rajoan Rahman Rifat",
                          style: buildTextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 50,
          right: 50,
          top: 140,
          child: Container(
            height: 170,
            width: 320,
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 47, 125, 121),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(47, 125, 121, 0.3), offset: Offset(0, 6), blurRadius: 12, spreadRadius: 6)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Balance",
                      style: buildTextStyle(),
                    ),
                    Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$ 2,938",
                  style: buildTextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Color.fromARGB(255, 85, 145, 141),
                          child: Icon(
                            Icons.arrow_downward,
                            size: 19,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Income",
                          style: buildTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Color.fromARGB(255, 85, 145, 141),
                          child: Icon(
                            Icons.arrow_upward,
                            size: 19,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Expense",
                          style: buildTextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ 1,200",
                        style: buildTextStyle(),
                      ),
                      Text(
                        "\$ 1,200",
                        style: buildTextStyle(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextStyle buildTextStyle({FontWeight? fontWeight, double? fontSize, Color? color}) {
  return TextStyle(fontWeight: fontWeight ?? FontWeight.w500, fontSize: fontSize ?? 16.0, color: color ?? Colors.white);
}
