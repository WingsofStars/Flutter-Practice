import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Back, Timmy.',
          style: TextStyle(color: AppColors.infoPrimary, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/help_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg',
              color: AppColors.infoSecondary,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          if (index == 0) {
          return Container(
            height: 200,
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              color: AppColors.laxPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                '“Give yourself some credit for the days you made it when you thought you couldn\'t.”',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.symbolColor, fontSize: 24, fontFamily: 'IbarraRealNova', fontStyle: FontStyle.normal),
              ),
            ),
          ); 
          }
        },
        
      )
    );
  }
}
