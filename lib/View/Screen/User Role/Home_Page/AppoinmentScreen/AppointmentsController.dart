import 'package:get/get.dart';
import 'AppointmentModel/AppointmentModel.dart';

class AppointmentsController extends GetxController {
  RxList<AppointmentModel> appointments = <AppointmentModel>[].obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void loadData() {
    final data = [
      {
        "name": "John Doe",
        "image": "https://i.pravatar.cc/150?img=1",
        "date": "8 Feb 2025",
        "description": "Consultation appointment.",
        "status": "pending",
      },
      {
        "name": "Sarah Parker",
        "image": "https://i.pravatar.cc/150?img=3",
        "date": "12 Feb 2025",
        "description": "Follow-up discussion.",
        "status": "confirmed",
      },
      {
        "name": "Michael Smith",
        "image": "https://i.pravatar.cc/150?img=4",
        "date": "5 Feb 2025",
        "description": "User cancelled the appointment.",
        "status": "cancelled",
      },
    ];

    appointments.value = data.map((e) => AppointmentModel.fromJson(e)).toList();
  }

  List<AppointmentModel> filter(String s) =>
      appointments.where((e) => e.status == s).toList();
}
