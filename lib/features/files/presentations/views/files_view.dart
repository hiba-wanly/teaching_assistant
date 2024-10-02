import 'package:flutter/material.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

class FilesView extends StatefulWidget {
  Subject subject;
   FilesView({Key? key,required this.subject}) : super(key: key);

  @override
  State<FilesView> createState() => _FilesViewState();
}

class _FilesViewState extends State<FilesView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


