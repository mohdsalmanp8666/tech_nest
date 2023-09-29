import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/providers/onBoardingProvider.dart';
import 'package:tech_nest/styles.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var i = ;
    // * Dimensions of device
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var i = context.watch<OnBoardingProvider>().index;
    return Scaffold(
      // appBar: AppBar(
      //   leading: Text(
      //     "${i}",
      //     style: headLine(h4, FontWeight.normal, Colors.black),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.7,
              width: width,
              child: PageView.builder(
                itemCount: 3,
                reverse: false,
                onPageChanged: (value) =>
                    context.read<OnBoardingProvider>().assignIndex(value),
                controller: context.read<OnBoardingProvider>().pgNum,
                itemBuilder: (context, index) {
                  if (i == 0) {
                    return page('pana.svg', "Smart",
                        "Manage the power usage of all your electronic device at your convinience ");
                  } else if (i == 1) {
                    return page('rafiki.svg', "Control",
                        "Control all your electronic devices with at a single click with just your smart phone");
                  } else {
                    return page('bro.svg', "Automate",
                        "Create routines and schedule devices to run along with your routine");
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.05,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Indicator(w: i != 0 ? 25 : 50),
                  Indicator(w: i != 1 ? 25 : 50),
                  Indicator(w: i != 2 ? 25 : 50),
                ],
              ),
            ),
            // * Next Button for swapping the on boarding screens
            NextButton(
              height: height,
              width: width,
              buttonText: i == 2 ? "Get Started" : "Next",
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double w;
  const Indicator({
    super.key,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: w,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: w == 50 ? primaryColor : greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

Column page(imgName, heading, txt) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset("assets/images/$imgName"),
      Column(
        children: [
          Text(
            heading,
            // style: ThemeData().textTheme.displayLarge,
            style: headLine(h3, FontWeight.w500, primaryColor),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Text(txt,
                  textAlign: TextAlign.center,
                  style: headLine(body, FontWeight.normal, greyColor))),
        ],
      ),
    ],
  );
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonText,
  });

  final double height;
  final double width;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    int index = context.read<OnBoardingProvider>().index;
    return Container(
      height: height * 0.2,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: height * 0.065),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          // print(index);
          if (index == 2) {
            Navigator.popAndPushNamed(context, '/loginScreen');
          }
          //else {
          context.read<OnBoardingProvider>().increaseIndex();
          // }
        },
        child: Text(
          buttonText,
          style: headLine(h4, FontWeight.normal, Colors.white),
        ),
      ),
    );
  }
}
