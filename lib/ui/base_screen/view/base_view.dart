import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invesq/ui/lead_screen/view/lead_screen.dart';
import 'package:invesq/ui/profile_screen/view/profile_screen.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/enum_utils.dart';
import '../../../utils/extension_utils.dart';
import '../../../utils/text_utils.dart';
import '../../../widgets/custom_app_bar_widget.dart';
import '../../../widgets/floating_action_button.dart';
import '../../../widgets/scaffold_widget.dart';
import '../bloc/base_bloc.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: BaseScreenType.values.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseBloc = context.read<BaseBloc>();

    return BlocConsumer<BaseBloc, BaseState>(
      listenWhen: (previous, current) =>
          previous.baseScreenType != current.baseScreenType,
      listener: (context, state) {
        _tabController.animateTo(state.baseScreenType.index);
      },
      buildWhen: (previous, current) =>
          previous.baseScreenType != current.baseScreenType,
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            DefaultTabController(
              initialIndex: 0,
              length: BaseScreenType.values.length,
              child: BlocBuilder<BaseBloc, BaseState>(
                buildWhen: (previous, current) =>
                    previous.baseScreenType != current.baseScreenType,
                builder: (context, state) {
                  return ScaffoldWidget(
                    floatingActionButton: CustomFloatingActionButton(),
                    canPop: state.baseScreenType == BaseScreenType.profile,
                    popInvokedWithResultCallback: (didPop, result) {
                      if (state.baseScreenType != BaseScreenType.profile) {
                        baseBloc.add(
                          const OnTapBottomNavigationItemEvent(
                            baseScreenType: BaseScreenType.profile,
                          ),
                        );
                      }
                    },
                    appBarWidget: CustomAppBarWidget(
                      title: state.baseScreenType.title,
                    ),
                    bottomNavigationBar: _buildBottomBar(
                      context,
                      state.baseScreenType,
                    ),

                    child: SafeArea(
                      child: TabScreenView(tabController: _tabController),
                    ),
                  );
                },
              ),
            ),
            // const LoadingIndicatorProgressView(),
          ],
        );
      },
    );
  }
}

class TabScreenView extends StatelessWidget {
  const TabScreenView({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseBloc, BaseState>(
      builder: (context, state) {
        return TabBarView(
          // key: context.utils.widgetKeysUtils.baseScreenWidgetKeys.tabBarViewKey,
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [ProfileScreen(), LeadScreen()],
        );
      },
    );
  }
}

Widget _buildBottomBar(BuildContext context, BaseScreenType current) {
  return BottomAppBar(
    shape: const CircularNotchedRectangle(),
    notchMargin: 8,
    child: SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomItem(
            icon: Icons.person,
            label: 'Profile',
            type: BaseScreenType.profile,
            current: current,
          ),
          const SizedBox(width: 40),
          _BottomItem(
            icon: Icons.group,
            label: 'Members',
            type: BaseScreenType.members,
            current: current,
          ),
        ],
      ),
    ),
  );
}

// /// 🔹 Reusable Chips
// class _InfoChip extends StatelessWidget {
//   final String text;
//   const _InfoChip({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(text, style: const TextStyle(fontSize: 12)),
//       backgroundColor: const Color(0xFFE0ECFF),
//     );
//   }
// }
//
// class _TagChip extends StatelessWidget {
//   final String text;
//   const _TagChip({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Chip(
//       label: Text(text, style: const TextStyle(fontSize: 12)),
//       backgroundColor: const Color(0xFFFBBF24),
//     );
//   }
// }
//
/// 🔹 Bottom Bar Item
class _BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final BaseScreenType type;
  final BaseScreenType current;

  const _BottomItem({
    required this.icon,
    required this.label,
    required this.type,
    required this.current,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = type == current;
    final color = isActive ? ColorUtils.primaryColor : ColorUtils.greyColor;

    return InkWell(
      onTap: () {
        context.read<BaseBloc>().add(
          OnTapBottomNavigationItemEvent(baseScreenType: type),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            Text(
              label,
              style: poppinsMedium.copyWith(fontSize: 12, color: color),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sharadagram/widgets/custom_app_bar_widget.dart';
// import 'package:sharadagram/widgets/scaffold_widget.dart';
//
// class BaseScreen extends StatefulWidget {
//   static const String route = '/base';
//
//   const BaseScreen({super.key});
//
//   @override
//   State<BaseScreen> createState() => _BaseScreenState();
// }
//
// class _BaseScreenState extends State<BaseScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldWidget(
//       appBarWidget: CustomAppBarWidget(title: "Profile"),
//       bottomNavigationBar: _buildBottomBar(),
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _buildProfileCard(),
//             const SizedBox(height: 16),
//             _buildSectionTile(
//               icon: Icons.person_outline,
//               title: 'General information',
//               editable: true,
//             ),
//             _buildSectionTile(
//               icon: Icons.groups_outlined,
//               title: 'Family information',
//               editable: true,
//             ),
//             _buildSectionTile(
//               icon: Icons.school_outlined,
//               title: 'Education',
//               expandable: true,
//             ),
//             _buildSectionTile(
//               icon: Icons.work_outline,
//               title: 'Profession',
//               expandable: true,
//             ),
//             _buildSectionTile(
//               icon: Icons.email_outlined,
//               title: 'Contact',
//               expandable: true,
//             ),
//             _buildBusinessProfile(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // 🔹 Profile Card
//   Widget _buildProfileCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFF3B82F6), width: 2),
//       ),
//       child: Column(
//         children: [
//           Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               const CircleAvatar(
//                 radius: 42,
//                 backgroundImage: AssetImage(
//                   'assets/images/profile_placeholder.png',
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF3B82F6),
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.camera_alt,
//                   size: 16,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'NANDLAL KARKAR',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 4),
//           const Text(
//             'nandlkarkar@gmail.com',
//             style: TextStyle(fontSize: 13, color: Colors.grey),
//           ),
//           const SizedBox(height: 12),
//           Wrap(
//             spacing: 8,
//             runSpacing: 8,
//             alignment: WrapAlignment.center,
//             children: const [
//               _InfoChip(text: 'Year: 1971 to 1976'),
//               _InfoChip(text: 'Standard 7 to 11'),
//               _TagChip(text: 'Lived in Hostel'),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // 🔹 Section Tile
//   Widget _buildSectionTile({
//     required IconData icon,
//     required String title,
//     bool editable = false,
//     bool expandable = false,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.grey[700]),
//         title: Text(title),
//         trailing: editable
//             ? const Icon(Icons.edit, size: 20)
//             : expandable
//             ? const Icon(Icons.add, size: 20)
//             : const Icon(Icons.keyboard_arrow_down),
//         onTap: () {
//           // TODO: Expand / Edit
//         },
//       ),
//     );
//   }
//
//   // 🔹 Business Profile
//   Widget _buildBusinessProfile() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           ListTile(
//             leading: const Icon(Icons.badge_outlined),
//             title: const Text('Business Profile'),
//             trailing: const Icon(Icons.keyboard_arrow_up),
//           ),
//           const SizedBox(height: 20),
//           Icon(
//             Icons.insert_drive_file_outlined,
//             size: 60,
//             color: Colors.blue[100],
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             'Business Profile Is Not Provided',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       ),
//     );
//   }
//
// 🔹 Bottom Navigation
