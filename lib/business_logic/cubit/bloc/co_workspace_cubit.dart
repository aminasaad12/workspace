
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/business_logic/cubit/state/co_workspace_state.dart';
import 'package:workspace/data/repository/co_work_space_repository.dart';

import '../../../data/models/work_space_model.dart';

class WorkspaceCubit extends Cubit<WorkspaceState>{

  final CoWorkSpaceRepository coWorkSpaceRepository;

  List<Workspace> workspaces = [];

  WorkspaceCubit(this.coWorkSpaceRepository)
      : super(WorkspaceInitial());

  List<Workspace> getAllCoWorkSpace(){
    coWorkSpaceRepository.getAllCoWorkSpace().
    then((workspaces){
      emit(WorkspaceLoaded(workspaces));
      this.workspaces = workspaces;
    });
    return workspaces ;
  }


}