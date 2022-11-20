import 'package:flutter/material.dart';
import 'package:flutter_finance_app/home.dart';
import 'package:flutter_finance_app/utils.dart';

import 'chart.dart';
import 'model/money.dart';

class StatisticState extends StatefulWidget {
  const StatisticState({Key? key}) : super(key: key);

  @override
  _StatisticStateState createState() => _StatisticStateState();
}

class _StatisticStateState extends State<StatisticState> {
  List day = ["Day", "Week", "Month", "Year"];
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Statistics",
                    style: buildTextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            index_color = index;
                            setState(() {});
                          },
                          child: Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: index_color == index ? Color.fromARGB(255, 47, 125, 121) : Colors.white,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              day[index],
                              style: buildTextStyle(color: index_color == index ? Colors.white : Colors.black),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Expense",
                              style: buildTextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Chart(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Spending",
                        style: buildTextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 19),
                      ),
                      Icon(
                        Icons.swap_vert,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: getData().length,
                    itemBuilder: (_, index) {
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
                          "\$ " + getData()[index].fee!,
                          style: buildTextStyle(color: getData()[index].buy ? Colors.green : Colors.red, fontSize: 14),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
