// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/components/custom_text.dart';
// import 'package:food_delivery_app/providers/counter_provider.dart';
// import 'package:food_delivery_app/screens/state_management_example/screen_two.dart';
// import 'package:food_delivery_app/utils/app_colors.dart';
// import 'package:food_delivery_app/utils/util_function.dart';
// import 'package:provider/provider.dart';

// class ScreenOne extends StatefulWidget {
//   const ScreenOne({Key? key}) : super(key: key);

//   @override
//   _ScreenOneState createState() => _ScreenOneState();
// }

// class _ScreenOneState extends State<ScreenOne> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(child: Consumer<CounterProvider>(
//           builder: (context, value, child) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     value.increaseCounter();
//                   },
//                   child: CustomText(
//                     text: '+',
//                     color: kwhite,
//                   ),
//                 ),
//                 CustomText(
//                   text: value.getCounter.toString(),
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     value.decreaseCounter();
//                   },
//                   child: CustomText(text: '-', color: kwhite),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     UtilFunction.navigateTo(context, ScreenTwo());
//                   },
//                   child: CustomText(text: 'Go to 2nd', color: kwhite),
//                 ),
//               ],
//             );
//           },
//         )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/custom_text.dart';
import 'package:food_delivery_app/providers/counter_provider.dart';
import 'package:food_delivery_app/screens/state_management_example/screen_two.dart';
import 'package:food_delivery_app/utils/app_colors.dart';
import 'package:food_delivery_app/utils/util_function.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .increaseCounter();
              },
              child: CustomText(
                text: '+',
                color: kwhite,
              ),
            ),
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return CustomText(
                  text: value.getCounter.toString(),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .decreaseCounter();
              },
              child: CustomText(text: '-', color: kwhite),
            ),
            ElevatedButton(
              onPressed: () {
                UtilFunction.navigateTo(context, ScreenTwo());
              },
              child: CustomText(text: 'Go to 2nd', color: kwhite),
            ),
          ],
        )),
      ),
    );
  }
}
