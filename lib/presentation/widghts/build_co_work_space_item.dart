import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:workspace/constants/strings.dart';

import '../../data/models/work_space_model.dart';

class Co_WorkSpaceItem extends StatelessWidget {
  final Workspace workspace;
 const Co_WorkSpaceItem({super.key, required this.workspace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 28.0
      ),
      child: InkWell(
        onTap: ()=>Navigator.pushNamed(context,workspacedetailsScreen,arguments: workspace),

        child: Container(
          width: double.infinity, //parent size
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 20.0
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromWidth(100.0), // Image radius
                    child: Image.network('http://okoolextra.com/${workspace.images![0].imageUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  workspace.name.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),),
                  Text(
                  workspace.address.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,

                    ),),
                  RatingBar.builder(
                        initialRating: workspace.evaluation!.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.5),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },


    ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}


