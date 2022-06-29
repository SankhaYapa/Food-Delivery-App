import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/providers/counter_provider.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenTwo> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Container(child: Consumer<CounterProvider>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  value.increaseCounter();
                },
                child: CustomText(
                  text: '+',
                  color: kwhite,
                ),
              ),
              CustomText(
                text: "${value.getCounter}",
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
              ElevatedButton(
                onPressed: () {
                  value.decreaseCounter();
                },
                child: CustomText(text: '-', color: kwhite),
              ),
              ElevatedButton(
                onPressed: () {
                  UtilFunction.goBack(context);
                },
                child: CustomText(text: 'Go back', color: kwhite),
              ),
            ],
          );
        },
      )),
    ));
  }
}
