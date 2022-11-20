import 'package:flutter/material.dart';
import 'package:flutter_finance_app/home.dart';
import 'package:flutter_finance_app/utils.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String? selectedItem;
  String? selectedItemExpense;
  List<String> nameList = ["food", "transfer", "transportation", "education"];
  List<String> expenseOnList = ["Income", "Expand"];
  TextEditingController explainC = TextEditingController();
  TextEditingController amountC = TextEditingController();

  FocusNode ex = FocusNode();

  DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    ex.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                    color: Color(0xff368983),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Text(
                            "Add Expense",
                            style: buildTextStyle(fontSize: 18),
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xff368983),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 500,
            width: 340,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1, color: Color(0xffC5C5C5))),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedItem,
                      hint: Text("Name"),
                      underline: Container(),
                      items: nameList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "$imageAsset$e.png",
                                      height: 30,
                                      width: 30,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      e,
                                      style: buildTextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedItem = value;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: explainC,
                    focusNode: ex,
                    decoration: buildInputDecoration("Explain"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: amountC,
                    decoration: buildInputDecoration("Amount"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1, color: Color(0xffC5C5C5))),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedItemExpense,
                      hint: Text("How"),
                      underline: Container(),
                      onChanged: (val) {
                        selectedItemExpense = val;
                        setState(() {});
                      },
                      items: expenseOnList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    Text(
                                      e,
                                      style: buildTextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 1, color: Color(0xffC5C5C5))),
                    child: TextButton(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100));
                        if (newDate != null) {
                          date = newDate;
                          setState(() {});
                        }
                      },
                      child: Text(
                        "Date: ${date.year}/${date.month}/${date.day}",
                        style: buildTextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Spacer(),
                  MaterialButton(
                    height: 45,
                    onPressed: () {},
                    minWidth: double.infinity,
                    color: Color(0xff368983),
                    splashColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    child: Text("Save",style: buildTextStyle(),),

                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  InputDecoration buildInputDecoration(labelText) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      labelText: labelText,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Color(0xffC5C5C5))),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Color(0xffC5C5C5))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Color(0xffC5C5C5))),
    );
  }
}
