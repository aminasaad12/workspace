
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/business_logic/cubit/bloc/co_workspace_cubit.dart';
import 'package:workspace/data/models/work_space_model.dart';
import 'package:workspace/data/repository/co_work_space_repository.dart';
import 'package:workspace/data/web_services/co_work_space_web_service.dart';

import '../constants/strings.dart';
import '../presentation/screens/co_work_space_details_screen.dart';
import '../presentation/screens/co_work_space_screen.dart';

class  AppRouter{

  late CoWorkSpaceRepository coWorkSpaceRepository;
  late WorkspaceCubit workspaceCubit;

  AppRouter()
  {

    coWorkSpaceRepository=CoWorkSpaceRepository(CoWorkSpaceWebService());
    workspaceCubit=WorkspaceCubit(coWorkSpaceRepository);

  }


  Route? generateRoute(RouteSettings settings){

    switch(settings.name){
      case workspaceScreen :
        return MaterialPageRoute(
            builder: (_)=> BlocProvider(
              create: (BuildContext context)=> WorkspaceCubit(coWorkSpaceRepository),
                child: CoWorkSpaceScreen()));
      case workspacedetailsScreen :
        final workspace = settings.arguments as Workspace;
        return MaterialPageRoute(
            builder: (_)=>CoWorkSpaceDetailsScreen(workspace: workspace,));


    }
    return null;
  }
}