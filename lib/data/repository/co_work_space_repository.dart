
import 'package:workspace/data/web_services/co_work_space_web_service.dart';

import '../models/work_space_model.dart';

class CoWorkSpaceRepository{

  final CoWorkSpaceWebService coWorkSpaceWebService;

  CoWorkSpaceRepository(this.coWorkSpaceWebService);

  Future<List<Workspace>> getAllCoWorkSpace() async{
    final workspace = await coWorkSpaceWebService.getAllCoWorkSpace();
    return workspace.map((workspaces) => Workspace.fromJson(workspaces)).toList();

  }

  

}