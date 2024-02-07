//* Custom App Bar for Login & Register Screens
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final zise = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: colors.surface,
      expandedHeight: zise.height * 0.35,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Stack(
            children: [
              SizedBox.expand(
                child: Image.network('https://cdn.pixabay.com/photo/2018/03/20/18/23/cartography-3244166_1280.png') //SvgPicture.asset('assets/images/mt_logo.svg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}