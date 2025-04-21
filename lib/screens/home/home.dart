// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:task_app_flutter/components/input_field.dart';
import 'package:task_app_flutter/utility/color_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_app_flutter/utility/custom_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? _user = FirebaseAuth.instance.currentUser;
  final ScrollController _scrollController = ScrollController();

  double _horizontalPadding = 15.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _horizontalPadding = _scrollController.offset == 0.0 ? 15.0 : 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        backgroundColor: Appcolors.primaryColor,
        child: Icon(
          Icons.add,
          color: Appcolors.white,
        ),
      ),
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.white,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Appcolors.primaryColor.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/menu.png',
            ),
          ),
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.only(
              right: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Appcolors.primaryColor.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset('assets/images/profile_1.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: Column(
                children: [
                  InputField(
                    suffixIcon: true,
                    suffixImagePath: 'assets/icons/search.png',
                    hint: 'Search a task.....',
                    textColor: Appcolors.white,
                    hintColor: Appcolors.black.withOpacity(0.4),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                padding: EdgeInsets.only(
                  left: _horizontalPadding,
                  right: _horizontalPadding,
                ),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  TaskStatus(
                    color: Appcolors.accentPurple,
                    icon: Icons.pending_outlined,
                    name: 'To-do',
                    pendingTask: '3',
                  ),
                  TaskStatus(
                    color: Appcolors.warning,
                    icon: Icons.pending_actions,
                    name: 'Progress',
                    pendingTask: '1',
                  ),
                  TaskStatus(
                    color: Appcolors.success,
                    icon: Icons.task_alt,
                    name: 'Done',
                    pendingTask: '0',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 30,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Appcolors.white,
                  border: Border.all(
                    color: Appcolors.primaryColor.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TaskStatus(
                          color: Appcolors.accentPurple.withOpacity(0.5),
                          icon: Icons.pending_outlined,
                          name: 'To-do',
                          pendingTask: '3',
                          isThisTag: true,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Today',
                          style: CustomFonts.body(
                            color: Appcolors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Tasks(),
                    Tasks(),
                    Tasks()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskStatus extends StatelessWidget {
  const TaskStatus({
    super.key,
    required this.color,
    required this.icon,
    this.name = '',
    this.pendingTask = '',
    this.ontap,
    this.isThisTag = false,
  });

  final Color color;
  final IconData icon;
  final String name;
  final String pendingTask;
  final ontap;
  final bool isThisTag;
  @override
  Widget build(BuildContext context) {
    return !isThisTag
        ? GestureDetector(
            onTap: ontap,
            child: Container(
              margin: EdgeInsetsDirectional.only(
                end: 15,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    color: Appcolors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    name,
                    style: CustomFonts.body(
                      color: Appcolors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Appcolors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      pendingTask,
                      style: CustomFonts.caption(
                        color: Appcolors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              name,
              style: CustomFonts.caption(
                color: Appcolors.white,
              ),
            ),
          );
  }
}

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  bool onTapCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                onTapCheckBox = !onTapCheckBox;
              });
            },
            child: onTapCheckBox
                ? Icon(
                    Icons.check_box_outlined,
                    color: Appcolors.success,
                  )
                : Icon(
                    Icons.check_box_outline_blank,
                    color: Appcolors.borderDark,
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Task 1',
            style: CustomFonts.body(
              color: Appcolors.black,
              decoration: onTapCheckBox
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
