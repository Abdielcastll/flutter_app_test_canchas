library reserve_view;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tu_cancha/presentation/views/reserve/widgets/dropdown_canchas.dart';
import 'package:tu_cancha/presentation/views/theme.dart';
import 'package:tu_cancha/presentation/widgets/dialogs.dart';
import 'package:tu_cancha/presentation/widgets/progress_widget.dart';

import '../../di/locator.dart';
import '../../widgets/button_floating.dart';
import 'reserve_view_model.dart';
import 'widgets/canchas_select_widget.dart';
import 'widgets/card_wether.dart';
import 'widgets/datepicker_widget.dart';
import 'widgets/reserve_text_field.dart';

part 'reserve_mobile.dart';

class ReserveView extends StatelessWidget {
  static const routeName = 'reserve';
  const ReserveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReserveViewModel viewModel = ReserveViewModel(getIt(), getIt(), getIt());
    return ViewModelBuilder<ReserveViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        onModelReady: (viewModel) => viewModel.onInit(context),
        builder: (context, viewModel, child) {
          return _ReserveMobile(viewModel);
        });
  }
}
