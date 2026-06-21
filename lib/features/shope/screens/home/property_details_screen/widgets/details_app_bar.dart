import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../notifications/notifications.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

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
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_forward,color: TColors.PrimaryColor,)),
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
                .eq(
              'id',
              Supabase.instance.client.auth.currentUser!.id,
            )
                .single(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircleAvatar(
                  radius: 20,
                );
              }

              final imageUrl =
              snapshot.data!['profile_image']?.toString();

              return CircleAvatar(
                radius: 20,
                backgroundImage:
                imageUrl != null && imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : const AssetImage(TImages.user)
                as ImageProvider,
              );
            },
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
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
            icon: const Icon(Icons.notifications_none, color: TColors.PrimaryColor),
          ),
        ],
      ),
    );
  }
}