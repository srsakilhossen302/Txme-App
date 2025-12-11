import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:txme_app/Utils/AppImg/app_img.dart';
import 'package:txme_app/Utils/StaticString/static_string.dart';
import 'package:txme_app/View/Screen/User%20Role/Home_Page/homePage.dart';
import '../../../../Utils/AppColors/app_colors.dart';
import '../../../Widgegt/CustomBottomNavBar/CustomBottomNavBar.dart';
import '../../../Widgegt/CustomBottomNavBar/ProviderNavBar.dart';
import '../../../Widgegt/Logout/Logout.dart';
import '../../User Role/Profile/EditProfile/EditProfile.dart';
import '../../User Role/Profile/NotificationPage/NotificationSettingsPage.dart';
import '../../User Role/Profile/VerificationPage/VerificationPage.dart';
import '../../User Role/Profile/pastInvoice/InvoiceListPage.dart';

class ProviderProfilePage extends StatelessWidget {
  const ProviderProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.FFFFFF,
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
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/300",
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const Text(
                      "Mahram",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Electrician",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, size: 18, color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 22),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFF5A36), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statItem(
                    image: AppImg.earnings,
                    value: "€355",
                    label: "Rating",
                  ),
                  _statItem(
                    image: AppImg.active,
                    value: "2 Orders",
                    label: "Completed",
                  ),
                  _statItem(
                    image: AppImg.completed,
                    value: "4 Years",
                    label: "Experience",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              "Profile information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => Get.to(() => EditProfilePage()),
              child:
                  menuItem(
                      img: AppImg.editProfile,
                      title: "Edit Profile"),
            ),

            GestureDetector(
              onTap: () => Get.to(() => VerificationPage()),
              child: menuItem(
                  img: AppImg.profession,
                  title: "Profession"),
            ),

            GestureDetector(
              onTap: () => Get.to(() => VerificationPage()),
              child: menuItem(
                  img: AppImg.verification,
                  title: "Verification"),
            ),

            menuItem(
                img: AppImg.faceIdImg,
                title: "Setup FaceID"),



            const SizedBox(height: 20),
            const Text(
              "Wallet & Invoice",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              // onTap: () => Get.to(() => const WalletPage()),
              child: menuItem(
                  img: AppImg.wallet,
                  title: "Wallet"),
            ),
            GestureDetector(
              onTap: () => Get.to(() => InvoiceListPage()),
              child: menuItem(
                  img: AppImg.pastInvoices,

                  title: "Past Invoices"),
            ),




            const SizedBox(height: 20),
            const Text(
              "General Preferences",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => Get.to(() => NotificationSettings()),
              child: menuItem(

                  img: AppImg.notification,
                  title: "Notification"),
            ),



            faqItem(),

            GestureDetector(
              onTap: () => Get.dialog(const CustomLogoutPopup(),
                  barrierDismissible: false),
              child: logoutItem(),
            ),

            const SizedBox(height: 20),

            /// SWITCH MODE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Image.asset(AppImg.Change,),
                SizedBox(width: 6),
                Text(
                  "Change to Service Provider Mode",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () => Get.offAll(() => const Homepage()), // switch mode
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
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),

      ),


      bottomNavigationBar: CustomProvidernavbar(selectedIndex: 3),

    );
  }

  Widget menuItem({required String img, required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)
        ],
      ),
      child: Row(
        children: [
          Image.asset(img, height: 40, width: 40,),

          const SizedBox(width: 14),
          Expanded(
            child: Text(title,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          Container(
            height: 40,
            width: 40,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Color(0xFFFF5A36),
                borderRadius: BorderRadius.circular(8)),
            child: const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget faqItem() {
    return Container(
      margin:  EdgeInsets.only(top: 12, bottom: 12),
      padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
          color:  Color(0xffF5F9FB),
          borderRadius: BorderRadius.circular(12)),
      child:  Row(
        children: [
        Image.asset(AppImg.FAQ, height: 40, width: 40,),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              "FAQ (THIS IS LINKED WITH TXME FAQ)",
              style: TextStyle(
                  color: Color(0xFFFF5A36), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget logoutItem() {
    return Container(
      margin:  EdgeInsets.only(bottom: 12),
      padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
          color:  Color(0xffF5F9FB),
          borderRadius: BorderRadius.circular(12)),
      child:  Row(
        children: [

         Image.asset(AppImg.Logout, height: 40, width: 40,),

          SizedBox(width: 14),
          Text("Logout",
              style: TextStyle(
                  color: Color(0xFFFF5A36), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _statItem(
      {required String image, required String value, required String label}) {
    return Column(
      children: [
        SizedBox(
          width: 33,
          height: 30,
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
