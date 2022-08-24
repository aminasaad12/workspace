


import 'package:flutter/cupertino.dart';
import 'package:workspace/data/models/work_space_model.dart';

@immutable
abstract class WorkspaceState {}

class WorkspaceInitial extends WorkspaceState {}

class WorkspaceLoaded extends WorkspaceState {
  final List<Workspace> workspace;
  WorkspaceLoaded(this.workspace);
}
