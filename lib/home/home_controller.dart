import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

import 'home_repository.dart';

class HomeController {

  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState value) => stateNotifier.value = value;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final _repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await _repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await _repository.getQuizzes();
    state = HomeState.success;
  }
}