
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/business_logic/cubit/bloc/co_workspace_cubit.dart';
import 'package:workspace/presentation/widghts/widght_container_details_screen.dart';

class CoWorkSpaceScreen extends StatefulWidget {
  const CoWorkSpaceScreen({Key? key}) : super(key: key);

  @override
  State<CoWorkSpaceScreen> createState() => _CoWorkSpaceScreenState();
}

class _CoWorkSpaceScreenState extends State<CoWorkSpaceScreen> {



    @override
  void initState() {
    super.initState();
    BlocProvider.of<WorkspaceCubit>(context).getAllCoWorkSpace();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBlocWidget()
    );
  }
}
