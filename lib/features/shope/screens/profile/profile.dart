import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentease/features/shope/screens/chats/chats.dart';
import 'package:rentease/features/shope/screens/profile/widgets/divider.dart';
import 'package:rentease/features/shope/screens/profile/widgets/info_card.dart';
import 'package:rentease/features/shope/screens/profile/widgets/settings_tile.dart';
import 'package:rentease/features/shope/screens/technicalSupport/technicalSupport.dart';
import 'package:rentease/features/shope/screens/use/payment_fees_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../authentication/screens/login/login.dart';
import '../notifications/notifications.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, this.onSearchPressed});

  final VoidCallback? onSearchPressed;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String fullName = '';
  String email = '';
  String? profileImageUrl;

  bool isLoading = true;
  bool isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      setState(() => isLoading = false);
      return;
    }

    try {
      final data = await Supabase.instance.client
          .from('profiles')
          .select()
          .eq('id', user.id)
          .single();

      if (!mounted) return;

      setState(() {
        fullName = (data['full_name'] ?? '').toString();
        email = (data['email'] ?? user.email ?? '').toString();
        profileImageUrl = data['profile_image']?.toString();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        fullName = 'مستخدم RentEase';
        email = user.email ?? '';
        isLoading = false;
      });
    }
  }

  Future<void> pickProfileImage() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) {
      showMessage('يجب تسجيل الدخول أولاً');
      return;
    }

    final picker = ImagePicker();

    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedImage == null) return;

    try {
      setState(() => isUploadingImage = true);

      final bytes = await pickedImage.readAsBytes();
      final fileExt = pickedImage.name.split('.').last;
      final fileName =
          '${user.id}_${DateTime.now().millisecondsSinceEpoch}.$fileExt';

      await Supabase.instance.client.storage
          .from('profile-images')
          .uploadBinary(
        fileName,
        bytes,
        fileOptions: const FileOptions(
          cacheControl: '3600',
          upsert: false,
        ),
      );

      final imageUrl = Supabase.instance.client.storage
          .from('profile-images')
          .getPublicUrl(fileName);

      await Supabase.instance.client.from('profiles').update({
        'profile_image': imageUrl,
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('id', user.id);

      if (!mounted) return;

      setState(() {
        profileImageUrl = imageUrl;
      });

      showMessage('تم تحديث صورة الملف الشخصي');
    } on StorageException catch (e) {
      showMessage('خطأ في رفع الصورة: ${e.message}');
    } on PostgrestException catch (e) {
      showMessage('خطأ في حفظ الصورة: ${e.message}');
    } catch (e) {
      showMessage('حدث خطأ غير متوقع');
    } finally {
      if (mounted) {
        setState(() => isUploadingImage = false);
      }
    }
  }

  ImageProvider get profileImageProvider {
    if (profileImageUrl != null && profileImageUrl!.isNotEmpty) {
      return NetworkImage(profileImageUrl!);
    }

    return const AssetImage(TImages.userProfile);
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.right),
        backgroundColor: TColors.PrimaryColor,
      ),
    );
  }

  Future<void> logout() async {
    await Supabase.instance.client.auth.signOut();

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      appBar: TAppBar(
        title: 'الملف الشخصي',
        isBack: false,
        actionIcon: Icons.notifications_none,
        onActionPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationsScreen(
                onSearchPressed: () {
                  Navigator.pop(context);
                  widget.onSearchPressed?.call();
                },
              ),
            ),
          );
        },
      ),
      body: isLoading
          ? const Center(
        child: CircularProgressIndicator(
          color: TColors.PrimaryColor,
        ),
      )
          : SingleChildScrollView(
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
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage: profileImageProvider,
                    ),
                  ),

                  GestureDetector(
                    onTap: isUploadingImage ? null : pickProfileImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: TColors.PrimaryColor,
                        child: isUploadingImage
                            ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : const Icon(
                          Icons.edit,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                fullName.isEmpty ? 'مستخدم RentEase' : fullName,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1A1B1F),
                ),
              ),

              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xff747781),
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(
                    child: InfoCard(
                      value: '٤.٨',
                      label: 'التقييم',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: FutureBuilder(
                      future: Supabase.instance.client
                          .from('properties')
                          .select('id')
                          .eq(
                        'owner_id',
                        Supabase.instance.client.auth.currentUser!.id,
                      ),
                      builder: (context, snapshot) {
                        String count = '0';

                        if (snapshot.hasData) {
                          count = (snapshot.data as List).length.toString();
                        }

                        return InfoCard(
                          value: count,
                          label: 'عقاراتي',
                        );
                      },
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
                    fontWeight: FontWeight.w500,
                    color: TColors.PrimaryColor.withOpacity(0.60),
                  ),
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
                            builder: (context) => NotificationsScreen(
                              onSearchPressed: () {
                                Navigator.pop(context);
                                widget.onSearchPressed?.call();
                              },
                            ),
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
                            builder: (context) =>
                            const TechnicalSupportScreen(),
                          ),
                        );
                      },
                    ),
                    const TDivider(),
                    SettingsTile(
                      title: 'الرسوم ولمدفوعات',
                      icon: Icons.account_balance_wallet,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const PaymentFeesScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: logout,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEFEF),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'تسجيل الخروج',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                          color: const Color(0xffBA1A1A),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}