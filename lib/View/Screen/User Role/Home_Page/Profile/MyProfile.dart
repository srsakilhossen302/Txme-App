import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:txme_app/View/Screen/User%20Role/Home_Page/Profile/profile_controller.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Profile",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// PROFILE HEADER
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
                ),

                const SizedBox(width: 20),

                Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      controller.userName.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 18, color: Colors.orange),
                        const SizedBox(width: 5),
                        Text(
                          controller.rating.value.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
              ],
            ),

            const SizedBox(height: 22),

            const Text(
              "Profile information",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
            ),
            const SizedBox(height: 12),

            profileMenu(
              icon: Icons.person_outline,
              title: "Edit Profile",
              //onTap: () => Get.to(() => const EditProfilePage()),
            ),

            profileMenu(
              icon: Icons.verified_user_outlined,
              title: "Verification",
              //onTap: () => Get.to(() => const VerificationPage()),
            ),

            profileMenu(
              icon: Icons.fingerprint,
              title: "Setup FaceID",
            ),

            profileMenu(
              icon: Icons.wallet,
              title: "Wallet",
              //onTap: () => Get.to(() => const WalletPage()),
            ),

            const SizedBox(height: 20),

            const Text(
              "General Preferences",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87),
            ),
            const SizedBox(height: 12),

            profileMenu(
              icon: Icons.notifications_none,
              title: "Notification",
              //onTap: () => Get.to(() => const NotificationSettings()),
            ),

            profileMenu(
              icon: Icons.history,
              title: "Past Invoices",
              //onTap: () => Get.to(() => InvoiceListPage()),
            ),

            faqItem(),

            logoutItem(),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.sync_alt, color: Colors.blue),
                SizedBox(width: 6),
                Text(
                  "Change to Service Provider Mode",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            GestureDetector(
              // onTap: () {
              //   Get.offAll(() => const ServiceProviderHomePage(),
              //       transition: Transition.rightToLeft);
              // },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.redAccent),
                ),
                child: const Center(
                  child: Text(
                    "Switch",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// MENU ITEM
  Widget profileMenu({required IconData icon, required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 26, color: Colors.blue),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFF5A36),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  /// FAQ
  Widget faqItem() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xffF5F9FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.help_outline, color: Colors.blue, size: 26),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              "FAQ (THIS IS LINKED WITH TXME FAQ)",
              style: TextStyle(
                  color: Color(0xFFFF5A36),
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// LOGOUT
  Widget logoutItem() {
    return GestureDetector(
      onTap: () {
        //Get.dialog(const CustomLogoutPopup(), barrierDismissible: false);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xffF5F9FB),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.logout, color: Color(0xFFFF5A36), size: 26),
            SizedBox(width: 14),
            Text(
              "Logout",
              style: TextStyle(
                  color: Color(0xFFFF5A36),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
