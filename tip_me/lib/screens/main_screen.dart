import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_me/constants/constants.dart';
import 'package:tip_me/logic/tip_calc.dart';
import 'package:tip_me/services/color_provider.dart';
import 'package:tip_me/widgets/theme_button.dart';
import 'package:tip_me/widgets/widget_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int? heads;
  double? amount;
  int tipAmount = 1;
  final amountController = TextEditingController();
  final headsController = TextEditingController();
  TipCalc? tipCalc;
  @override
  Widget build(BuildContext context) {
    final colorizer = Provider.of<Colorizer>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Me!'),
        actions: [
          ThemeButton(
              onTap: () {
                if (colorizer.mainThemeGetter != ThemeData.dark()) {
                  colorizer.toggleTheme();
                }
              },
              bgColor: Colors.black38,
              fgColor: Colors.black),
          ThemeButton(
            onTap: () {
              if (colorizer.mainThemeGetter == ThemeData.dark()) {
                colorizer.toggleTheme();
              }
            },
            bgColor: Colors.white38,
            fgColor: Colors.white,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                //padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetCard(
                          side: 'left',
                          hintText: '£',
                          onChanged: (value) {
                            amount = double.tryParse(value!);
                          },
                          label: 'Amount',
                          controller: amountController,
                        ),
                        WidgetCard(
                          side: 'right',
                          hintText: 'Heads',
                          onChanged: (value) {
                            heads = int.tryParse(value!);
                          },
                          label: 'Heads',
                          controller: headsController,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.black54,
                      height: 120,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tip Percent : $tipAmount%',
                            style: textStyle1,
                          ),
                          Slider(
                            value: tipAmount.toDouble(),
                            activeColor: Colors.orange.shade700,
                            inactiveColor: Colors.yellow.shade200,
                            divisions: 100,
                            max: 100,
                            min: 0,
                            label: '$tipAmount%',
                            thumbColor: Colors.green.shade200,
                            onChanged: (value) {
                              setState(() {
                                tipAmount = value.toInt();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          if (amount != null && heads != null) {
                            setState(() {
                              tipCalc = TipCalc(
                                  amount: amount,
                                  percent: tipAmount,
                                  head: heads);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Amount or No of Heads cannot equal null'),
                              ),
                            );
                          }
                        },
                        child: Container(
                          //margin: const EdgeInsets.only(right: 10),
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10).copyWith(
                                topRight: const Radius.circular(0),
                                bottomLeft: const Radius.circular(0)),
                            color: Colors.black54,
                          ),
                          child: Center(
                            child: Text(
                              'Calculate Tip',
                              style: textStyle1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white, thickness: .6, height: 15),
              const Divider(color: Colors.white, thickness: .6, height: 15),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).copyWith(
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                        color: Colors.black54,
                      ),
                      child: Text(
                        'TOTAL BILL:\n ${tipCalc?.totalBill() ?? '0'}',
                        style: textStyle1,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black54,
                      child: Text(
                        'TOTAL TIP:\n ${tipCalc?.calcTotalTip() ?? '0'}',
                        style: textStyle1,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.black54,
                      child: Text(
                        'TIP PER PERSON:\n ${tipCalc?.tipPerPerson() ?? '0'}',
                        style: textStyle1,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).copyWith(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                        ),
                        color: Colors.black54,
                      ),
                      child: Text(
                        'BILL PER PERSON:\n ${tipCalc?.totalBillPerPerson() ?? '0'}',
                        style: textStyle1,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
