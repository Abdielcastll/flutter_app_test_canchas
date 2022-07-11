part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel model;

  const _HomeMobile(this.model);

  @override
  Widget build(BuildContext context) {
    return ProgressWidget(
      inAsyncCall: model.loading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reserva tu cancha'),
          centerTitle: true,
        ),
        body: model.reservations.isEmpty
            ? SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/portapapeles.png',
                      color: AppColors.green,
                      width: MediaQuery.of(context).size.width * .50,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No tiene reservaciones!',
                      style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 60),
                itemBuilder: (context, i) {
                  var reservation = model.reservations[i];
                  return ReservationCardWidget(reservation, onPressed: () {
                    Dialogs.confirmDelete(context,
                        text: '¿Desea borrar la reservación?', ok: () async {
                      await model.deleteReservation(reservation.id!);
                      Navigator.of(context).pop();
                    });
                  });
                },
                itemCount: model.reservations.length,
              ),
        floatingActionButton: ButtonFloating(
          text: 'Crear Reservación',
          onPressed: model.goToReserve,
        ),
      ),
    );
  }
}
