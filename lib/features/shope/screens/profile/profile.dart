import 'package:flutter/material.dart';
import 'package:rentease/features/shope/screens/chats/chats.dart';
import 'package:rentease/features/shope/screens/profile/widgets/divider.dart';
import 'package:rentease/features/shope/screens/profile/widgets/info_card.dart';
import 'package:rentease/features/shope/screens/profile/widgets/settings_tile.dart';
import 'package:rentease/features/shope/screens/support/technical_support_screen.dart' hide TechnicalSupportScreen;
import 'package:rentease/features/shope/screens/technicalSupport/technicalSupport.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../notifications/notifications.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),

      appBar:  TAppBar(
        title: 'الملف الشخصي',
        actionIcon: Icons.notifications_none,
        onActionPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NotificationsScreen(),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 58,
                      backgroundImage: AssetImage(
                        TImages.userProfile,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child:const  CircleAvatar(
                      radius: 16,
                      backgroundColor: TColors.PrimaryColor,
                      child: Icon(
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Text(
                  'رغدة جمال',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff1A1B1F)
                  )
              ),
              Text(
                  'raghda@example.com',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff747781)
                  )
              ),

              const SizedBox(height: 24),

               const  Row(
                children: [
                  Expanded(
                    child: InfoCard(
                      value: '٤.٨',
                      label: 'التقييم',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: InfoCard(
                      value: '١٢',
                      label: 'عقاراتي',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                    'الإعدادات العامة',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight:FontWeight.w500,
                        color: TColors.PrimaryColor.withOpacity(0.60)
                    )
                ),
              ),

              const SizedBox(height: 16),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    SettingsTile(
                      title: 'الوضع الليلي',
                      icon: Icons.dark_mode_outlined,
                      trailing: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Transform.scale(
                          scale: 0.75,
                          child: Switch(

                            value: false,
                            onChanged: (value) {},
                            activeColor: Colors.white,
                            activeTrackColor: TColors.PrimaryColor,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: const Color(0xffE2E8F0),
                            trackOutlineColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const TDivider(),
                    SettingsTile(
                      title: 'الإشعارات',
                      icon: Icons.notifications_none,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                    const TDivider(),
                    SettingsTile(
                      title: 'المحادثات',
                      icon: Icons.chat_bubble_outline,
                      badgeCount: 3,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatsScreen(),
                          ),
                        );
                      },
                    ),
                    const TDivider(),
                    SettingsTile(
                      title: 'الدعم الفني',
                      icon: Icons.support_agent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TechnicalSupportScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 16),
                decoration: BoxDecoration(
                  color:  const Color(0xFFFFEFEF),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                        'تسجيل الخروج',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: const Color(0xffBA1A1A) ,
                            fontWeight: FontWeight.w700
                        )
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width:40,
                      height: 40,
                      decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: const Icon(
                        Icons.logout,
                        size: 18.960918426513672,
                        color: Color(0xffBA1A1A),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}