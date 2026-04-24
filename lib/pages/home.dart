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
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: AppColors.secondary,
            child: const Center(
              child: Text(
                'Your Dashboard',
                style: TextStyle(color: AppColors.symbolColor, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Add more widgets here for the dashboard content
        ],
      )
    );
  }
}
