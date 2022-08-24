import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workspace/presentation/widghts/build_item_work_space_details_screen.dart';
import '../../data/models/work_space_model.dart';

final  boardingController =CarouselController();

class CoWorkSpaceDetailsScreen extends StatelessWidget {
  final Workspace workspace;
  late List<Workspace> allCoWorkSpace;
   CoWorkSpaceDetailsScreen({super.key, required this.workspace});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: details_screen_item(workspace:workspace ,)
      )
    );
  }


}

