part of reserve_view;

class _ReserveMobile extends StatelessWidget {
  final ReserveViewModel model;

  const _ReserveMobile(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Reserva'),
        centerTitle: true,
      ),
      body: ProgressWidget(
        inAsyncCall: model.loading,
        child: _body(context),
      ),
      floatingActionButton: ButtonFloating(
        text: 'Reservar',
        onPressed: _saveReservation(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: _tittle('Canchas disponibles:'),
          ),
          AspectRatio(
            aspectRatio: 21 / 6,
            child: PageView.builder(
              itemBuilder: (context, i) {
                return CanchaSelectWidget(
                  cancha: model.courts[i],
                  // onTap: () => model.selectCancha(i),
                );
              },
              controller: model.pageController,
              itemCount: model.courts.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          DropDownCanchas(
            canchas: model.courts,
            hint: 'Seleccione una cancha',
            value: model.selectedCourt,
            onChanged: model.selectCourt,
          ),
          ReserveTextField(
            onChanged: model.onChangedName,
          ),
          DatePickerReserv(
            dateSelect: model.selectedDate,
            onConfirm: model.selectDate,
          ),
          Visibility(
            visible: model.selectedDate != null,
            child: CardWeather(
              desc: model.timeframe?.wxDesc ?? '',
              icon: model.timeframe?.wxIcon ?? '',
              probPrecipPct: model.timeframe?.probPrecipPct ?? '',
            ),
          )
        ],
      ),
    );
  }

  Function() _saveReservation(BuildContext context) {
    if (model.loading) return () {};
    return () async {
      var data = model.validateData();
      if (data) {
        var resp = await model.saveReservation();
        if (!resp) {
          Dialogs.alert(context,
              text:
                  'Cancha ocupada para el dia\n${DateFormat.yMMMMd('es').format(model.selectedDate!)}');
        }
      } else {
        Dialogs.alert(context, text: 'Datos incompletos');
      }
    };
  }

  Widget _tittle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w800,
        color: AppColors.green,
      ),
    );
  }
}
