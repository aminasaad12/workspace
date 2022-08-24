


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:workspace/data/models/work_space_model.dart';
import 'package:workspace/presentation/screens/co_work_space_details_screen.dart';

import 'widght_container_details_screen.dart';


void previous() =>boardingController.nextPage(duration: Duration(milliseconds: 500));

void next()=> boardingController.previousPage(duration: Duration(milliseconds: 500));

animationToSlide(int index) =>boardingController.animateToPage(index);
class details_screen_item extends StatefulWidget {
  final Workspace workspace;
   details_screen_item({Key? key, required this.workspace}) : super(key: key);

  @override
  State<details_screen_item> createState() => _details_screen_itemState();
}

class _details_screen_itemState extends State<details_screen_item> {
  late List<Workspace> allCoWorkSpace;

  bool wifi =false;

  bool cafe =false;

  bool events =false;

  bool studio =false;

  bool library =false;

  bool meetingsRoom =false;

  bool vacation =false;

  int actionIndex =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              carouselController: boardingController,
              itemCount: widget.workspace.images!.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
                    child: Image.network('http://okoolextra.com/${widget.workspace.images![itemIndex].imageUrl}',
                      fit: BoxFit.cover,),
                  ),
              options: CarouselOptions(
                height: 280,
                aspectRatio: 16/9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                // autoPlay: true,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                //autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index,reason)=>
                    setState(()=> actionIndex =index),
              ),

            ),
            Positioned(
              right: 140.0,
              top: 264.0,
              child: AnimatedSmoothIndicator(
                onDotClicked: animationToSlide,
                activeIndex: actionIndex,
                count: widget.workspace.images!.length,
                effect: JumpingDotEffect(
                    dotHeight: 9.0,
                    dotWidth: 8.0,
                    dotColor: Colors.white,
                    spacing:  6.0,
                    activeDotColor:  Colors.blue
                ),


              ),
            ),
            Positioned(
              left: 8.0,
              top: 130.0,
              child: IconButton(
                  onPressed: next,
                  icon: Icon(Icons.arrow_back_ios,size: 26,
                    color: Colors.blue,
                  )
              ),
            ),
            Positioned(
              left: 310.0,
              top: 130.0,
              child: IconButton(
                  onPressed: previous,
                  icon: Icon(Icons.arrow_forward_ios,size: 26,
                    color: Colors.blue,)
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
              top: 6.0,
              bottom: 25.0
          ),
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              color: Color(0xFFF2F1F0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 5),
                  blurRadius: 5,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 35.0,
                  right: 35.0
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.wifi, color: this.wifi==widget.workspace.wifi ? Colors.grey : Colors.blue),
                    Icon(Icons.local_cafe_rounded, color: this.cafe==widget.workspace.cafe ? Colors.grey : Colors.blue),
                    Icon(Icons.people_alt_rounded, color: this.events==widget.workspace.events ? Colors.grey : Colors.blue),
                    Icon(Icons.menu_book, color: this.library==widget.workspace.library ? Colors.grey : Colors.blue),
                    Icon(Icons.door_back_door_outlined, color: this.meetingsRoom==widget.workspace.meetingsRoom ? Colors.grey : Colors.blue),
                    Icon(Icons.camera, color: this.studio==widget.workspace.studio ? Colors.grey : Colors.blue),




                  ]
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
          [
            containerdetails(
                imagepath: 'assets/images/office-desk.png',
                num: widget.workspace.sharedRooms.toString(),
                text: "Private room"),
            containerdetails(
                imagepath: 'assets/images/meeting.png',
                num: widget.workspace.meetingsRooms.toString(),
                text: "Meetings room"),
            containerdetails(
                imagepath: 'assets/images/presentation.png',
                num: widget.workspace.trainingRooms.toString(),
                text: "Training room")
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: widget.workspace.timing!.length,
            itemBuilder:(ctx, index){
              return Row(
                children: [
                  Icon( ( vacation==widget.workspace.timing![index].vacation) ?
                  (Icons.check) : Icons.close,size: 22.0,color: Colors.red
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.workspace.timing![index].day.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
                          )),
                      Text('${widget.workspace.timing![index].start.toString()}:',
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                      Text(widget.workspace.timing![index].end.toString(),
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(Icons.date_range,
                    color: Colors.grey,
                  )

                ],
              );

            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              bottom: 20
          ),
          child: Container(
            height: 50.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color:  Color(0xFFF2F1F0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 8),
                  blurRadius: 5,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right:30.0,
                  left: 30.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.location_on_rounded,color: Colors.blue,),
                  Text('${widget.workspace.address.toString()}',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Text("Book"),
                  )


                ],
              ),
            ),

          ),
        ),







      ],
    );
  }
}
