import 'package:flutter/material.dart';
import 'package:rentease/common/widgets/appbar/appbar.dart';
import 'package:rentease/features/shope/screens/notifications/widgets/empty_notifications.dart';
import 'package:rentease/features/shope/screens/notifications/widgets/notification_card.dart';
import 'package:rentease/features/shope/screens/notifications/widgets/section_title.dart';
import '../../../../utils/constants/colors.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFFF8F9FB),
        appBar: TAppBar(
          title: 'التنبيهات',
          actionIcon:
            Icons.search,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle('اليوم'),
                NotificationCard(

                  time: 'منذ ساعتين',

                  title: 'تم استلام الدفعة',

                  body: 'لقد تم تحصيل مبلغ 1,500 شيكل مقابل إيجار شهر سبتمبر بنجاح.',

                  icon: Icons.account_balance_wallet_rounded,

                  iconColor: Color(0xFF16A34A),

                  iconBg: Color(0xFFF0FDF4),

                  isToday: true,

                ),
                NotificationCard(

                  time: 'منذ 4 ساعات',

                  title: 'طلب صيانة جديد',

                  body: 'المستأجر في شقة رقم 12 أرسل طلب صيانة لإصلاح إعدادات المياه.',

                  icon: Icons.build_outlined,

                  iconColor: TColors.PrimaryColor,

                  iconBg: Color(0xFFEFF6FF),

                  showSideLine: true,

                  isToday: true,

                ),
                NotificationCard(

                  time: 'منذ 6 ساعات',

                  title: 'تقييم جديد',

                  body: 'لقد حصلت على تقييم 5 نجوم من المستأجر خالد الحمص.',

                  icon: Icons.star,

                  iconColor: Colors.orange,

                  iconBg: Color(0xFFFFFBEB),

                  isToday: true,

                ),
                SizedBox(height: 32),
                SectionTitle('أمس', today: false),
                NotificationCard(

                  time: 'أمس، 10:15 م',

                  title: 'تجديد العقد',

                  body: 'العقد الخاص بـ "فيلا الياسمين" سينتهي خلال 30 يوماً. هل تود التجديد؟',

                  icon: Icons.description_outlined,

                ),
                NotificationCard(

                  time: 'أمس، 08:30 ص',

                  title: 'تحديث النظام',

                  body: 'تم تحديث تطبيق RentEase لتحسين تجربة المستخدم وإضافة خصائص أمان جديدة.',

                  icon: Icons.system_update_sharp,

                ),
                SizedBox(height: 32),
                EmptyNotifications(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
    );
  }
}

