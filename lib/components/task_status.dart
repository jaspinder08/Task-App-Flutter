import 'package:flutter/material.dart';
import 'package:task_app_flutter/utility/color_constants.dart';
import 'package:task_app_flutter/utility/custom_fonts.dart';

class TaskStatus extends StatelessWidget {
  const TaskStatus({
    super.key,
    required this.color,
    required this.icon,
    this.name = '',
    this.pendingTask = '',
  });

  final Color color;
  final IconData icon;
  final String name;
  final String pendingTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        end: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          const SizedBox(width: 8),
          Text(
            name,
            style: CustomFonts.body(
              color: Appcolors.white,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Appcolors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              pendingTask,
              style: CustomFonts.minitext(
                color: Appcolors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
