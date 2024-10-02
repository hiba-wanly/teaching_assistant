import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';
import 'package:teachers_marks/features/files/domain/use_cases/fetch_files_use_case.dart';
import 'package:teachers_marks/features/files/presentations/manager/files_cubit/files_state.dart';

class FilesCubit extends Cubit<FilesState> {
  FilesCubit(this.fetchFilesUseCase) : super(FilesInitial());

  final FetchFilesUseCase fetchFilesUseCase;


  Future<void> addFiles(Files data) async {
    emit(FilesLoading());
    debugPrint(data.toString());
    Map<String, dynamic> data2 = await data.toJson();
    var result = await fetchFilesUseCase.callAddFiles(data2);

    result.fold((failure) {
      emit(FilesFailure(failure.message));
    }, (files) {
      var filtered = filterFiles(files);
      // Access the lab and theory lists using their keys
      List<Files> labList = filtered['lab'] ?? [];
      List<Files> theoryList = filtered['theory'] ?? [];
      List<Files> homeworkList = filtered['homework'] ?? [];

      emit(FilesSuccess(labList ,theoryList ,homeworkList));
    });
  }

  Future<void> updateFile(Files data, int file_id) async {
    emit(FilesLoading());
    debugPrint(data.toString());
    Map<String, dynamic> data2 = await data.toJson();
    var result = await fetchFilesUseCase.callUpdateFiles(data2,file_id);

    result.fold((failure) {
      emit(FilesFailure(failure.message));
    }, (files) {
      var filtered = filterFiles(files);
      // Access the lab and theory lists using their keys
      List<Files> labList = filtered['lab'] ?? [];
      List<Files> theoryList = filtered['theory'] ?? [];
      List<Files> homeworkList = filtered['homework'] ?? [];

      emit(FilesSuccess(labList ,theoryList ,homeworkList));
    });
  }

  Future<void> getFiles( int sub_id) async {
    emit(FilesLoading());
    var result = await fetchFilesUseCase.callGetFiles( sub_id);

    result.fold((failure) {
      emit(FilesFailure(failure.message));
    }, (files) {
      var filtered = filterFiles(files);
      // Access the lab and theory lists using their keys
      List<Files> labList = filtered['lab'] ?? [];
      List<Files> theoryList = filtered['theory'] ?? [];
      List<Files> homeworkList = filtered['homework'] ?? [];

      emit(FilesSuccess(labList ,theoryList ,homeworkList));
  });
  }

  Future<void> deleteFile( int file_id) async {
    emit(FilesDeleteLoading());
    var result = await fetchFilesUseCase.callDeleteFiles(file_id);

    result.fold((failure) {
      emit(FilesFailure(failure.message));
    },(files) {
      var filtered = filterFiles(files);
      // Access the lab and theory lists using their keys
      List<Files> labList = filtered['lab'] ?? [];
      List<Files> theoryList = filtered['theory'] ?? [];
      List<Files> homeworkList = filtered['homework'] ?? [];

      emit(FilesSuccess(labList ,theoryList ,homeworkList));
    });
  }


  Map<String, List<Files>> filterFiles(List<Files> fileList){
    List<Files> listLab = [];
    List<Files> listTheory = [];
    List<Files> listHomework = [];

    for (var file in fileList) {
      if (file.type == 'lab') {
        listLab.add(file);
      } else if (file.type == 'theory') {
        listTheory.add(file);
      }else if (file.type == 'homework') {
        listHomework.add(file);
      }
    }
    return {
      'lab': listLab,
      'theory': listTheory,
      'homework': listHomework,
    };
  }

}
