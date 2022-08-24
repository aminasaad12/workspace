
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/business_logic/cubit/bloc/co_workspace_cubit.dart';
import 'package:workspace/business_logic/cubit/state/co_workspace_state.dart';
import 'package:workspace/data/models/work_space_model.dart';
import 'package:workspace/presentation/widghts/build_co_work_space_item.dart';

late List<Workspace> allCoWorkSpace;


Widget containerdetails({
  required String imagepath,
  required String num,
  required String text,
})=>Container(
  height: 140.0,
  width: 108.0,
  decoration: BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        offset: Offset(0, 8),
        blurRadius: 5,
        spreadRadius: 0,
      )
    ],
  ),
  child: Column(
    children: [
      Image.asset(imagepath,
        height: 70.0,
        width: 45.0,),
      Text(num,
        style: TextStyle(
            fontSize: 37.0
        ),),
      Text(text,
        style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold
        ),)

    ],
  ),
);


Widget buildBlocWidget() {
  return BlocBuilder<WorkspaceCubit, WorkspaceState>(
    builder: (context, state) {
      if (state is WorkspaceLoaded) {
        allCoWorkSpace = (state).workspace;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    },
  );
}
Widget showLoadingIndicator() {
  return Center(
    child: CircularProgressIndicator(
      color: Colors.black,
    ),
  );
}
Widget buildLoadedListWidgets() {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        children: [
          Image.network('http://okoolextra.com/coworking.jpg',),
          SizedBox(
            height: 8.0,
          ),
          buildWorkspaceList(),
        ],
      ),
    ),
  );
}
Widget buildWorkspaceList() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    padding: EdgeInsets.zero,
    itemCount: allCoWorkSpace.length,
    itemBuilder:(ctx, index) {
      return Co_WorkSpaceItem( workspace: allCoWorkSpace[index],);

    },
  );
}


void  NavigatorTo(context,widght)=> Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context)=>  widght,
    )
);