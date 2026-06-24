import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../notifications/notifications.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.beds,
    required this.baths,
    required this.area,
    required this.description,
    required this.ownerPhone,
  });

  final String image;
  final String title;
  final String location;
  final String price;
  final String beds;
  final String baths;
  final String area;
  final String description;
  final String ownerPhone;

  void shareProperty() {
    final mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}';

    final imageText = image.startsWith('http')
        ? '\n🖼 صورة العقار:\n$image'
        : '';

    final text = '''
🏠 عقار متاح على RentEase

العنوان: $title
📍 الموقع: $location
💰 السعر: $price
🛏 الغرف: $beds
🛁 الحمامات: $baths
📐 المساحة: $area

الوصف:
$description

📞 رقم المعلن: ${ownerPhone.isEmpty ? 'غير متوفر' : ownerPhone}

🗺 الموقع على الخريطة:
$mapsUrl
$imageText
''';

    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_forward, color: TColors.PrimaryColor),
          ),
          Text(
            'RentEase',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w700,
              color: TColors.PrimaryColor,
            ),
          ),
          const SizedBox(width: 12),
          FutureBuilder(
            future: Supabase.instance.client
                .from('profiles')
                .select('profile_image')
                .eq('id', Supabase.instance.client.auth.currentUser!.id)
                .single(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircleAvatar(radius: 20);
              }

              final imageUrl = snapshot.data!['profile_image']?.toString();

              return CircleAvatar(
                radius: 20,
                backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : const AssetImage(TImages.user) as ImageProvider,
              );
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: shareProperty,
            icon: const Icon(Icons.share_outlined, color: TColors.PrimaryColor),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: TColors.PrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}