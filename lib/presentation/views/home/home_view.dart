library home_view;

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tu_cancha/presentation/views/theme.dart';
import 'package:tu_cancha/presentation/widgets/progress_widget.dart';

import '../../di/locator.dart';
import '../../widgets/button_floating.dart';
import '../../widgets/dialogs.dart';
import '../../widgets/reservation_widget.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel(getIt(), getIt());
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) => viewModel.onInit(),
        builder: (context, viewModel, child) {
          return _HomeMobile(viewModel);
        });
  }
}
