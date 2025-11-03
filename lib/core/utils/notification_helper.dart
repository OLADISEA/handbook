import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../widgets/texts/app_text.dart';

enum NotificationType { success, error }


Future<void> showBottomModalNotification(
    BuildContext context,
    String message, {
      String title = '',
      NotificationType type = NotificationType.success,
      Duration duration = const Duration(seconds: 3),
      String? actionLabel,
      VoidCallback? onAction,
    }) {
  final color = type == NotificationType.success ? AppColors.modalColor : AppColors.red;

  final sheetFuture = showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.black.withValues(alpha: 0.3),
    isScrollControlled: true,
    builder: (ctx) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          constraints: BoxConstraints(maxWidth: 800.w),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: AppText(
                        text: message,
                        color: AppColors.white,
                        fontSize: 14.sp,
                      lineHeight: 1,
                    ),
                  ),
                  if (actionLabel != null && onAction != null) ...[
                    SizedBox(width: 12.w),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        onAction();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withValues(alpha: 0.15),
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: AppText(text: actionLabel, color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                ],
              ),
              SizedBox(height: 30.h,)
            ],
          ),
        ),
      );
    },
  );

  final timer = Timer(duration, () {
    if (Navigator.canPop(context)) Navigator.pop(context);
  });

  sheetFuture.whenComplete(() {
    if (timer.isActive) timer.cancel();
  });

  return sheetFuture;
}


Future<void> Function() showPersistentNotification(
    BuildContext context,
    String message, {
      Duration? animationDuration,
      double bottomOffset = 80.0,
    }) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (c) => _PersistentNotificationWidget(
      message: message,
      bottomOffset: bottomOffset,
      onDismiss: () {
        entry.remove();
      },
      animationDuration: animationDuration ?? const Duration(milliseconds: 300),
    ),
  );

  overlay.insert(entry);

  return () {
    try {
      entry.remove();
    } catch (_) {}
    return Future.value();
  };
}

Future<void> Function() showPersistentActionNotification(
    BuildContext context,
    String message, {
      String? actionLabel,
      VoidCallback? onAction,
      Duration? animationDuration,
      double bottomOffset = 50.0,
    }) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (c) => _PersistentNotificationWidget(
      message: message,
      actionLabel: actionLabel,
      onAction: () {
        entry.remove();
        if (onAction != null) onAction();
      },
      bottomOffset: bottomOffset,
      onDismiss: () {
        entry.remove();
      },
      animationDuration: animationDuration ?? const Duration(milliseconds: 300),
    ),
  );

  overlay.insert(entry);

  return () {
    try {
      entry.remove();
    } catch (_) {}
    return Future.value();
  };
}

class _PersistentNotificationWidget extends StatefulWidget {
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback onDismiss;
  final double bottomOffset;
  final Duration animationDuration;

  const _PersistentNotificationWidget({
    Key? key,
    required this.message,
    this.actionLabel,
    this.onAction,
    required this.onDismiss,
    required this.bottomOffset,
    required this.animationDuration,
  }) : super(key: key);

  @override
  State<_PersistentNotificationWidget> createState() =>
      _PersistentNotificationWidgetState();
}

class _PersistentNotificationWidgetState
    extends State<_PersistentNotificationWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnim;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _offsetAnim = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  void _dismiss() {
    if (!_visible) return;
    _visible = false;
    _controller.reverse().then((_) {
      widget.onDismiss();
    }).catchError((_) {
      widget.onDismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomSafe = MediaQuery.of(context).padding.bottom;
    final bottom = bottomSafe + 30.h;

    return Positioned(
      left: 26.w,
      right: 24.w,
      bottom: bottom,
      child: SlideTransition(
        position: _offsetAnim,
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (_) => _dismiss(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main notification card
              Material(
                borderRadius: BorderRadius.circular(12.r),
                elevation: 8,
                color: AppColors.primaryColor,
                child: InkWell(
                  onTap: widget.onAction,
                  child: Container(
                    height: 55.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        // Text
                        Expanded(
                          child: AppText(
                            text: widget.message,
                            color: AppColors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  
                        // Optional action button
                        if (widget.actionLabel != null && widget.onAction != null) ...[
                          SizedBox(width: 12.w),
                          TextButton(
                            onPressed: widget.onAction,
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: AppText(
                              text: widget.actionLabel!,
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


void showActionNotification(BuildContext context, String message,
    {NotificationType type = NotificationType.success,
    Duration duration = const Duration(seconds: 3),
    final String? actionLabel,
    final VoidCallback? onAction}) {
  final overlay = Overlay.of(context);
  late final OverlayEntry entry;
  Timer? timer;
  entry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top - 10,
      left: 16,
      right: 16,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        color: type == NotificationType.success ? Colors.green : Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: AppText(text: message, color: Colors.white),
              ),
              // 2) Conditionally show the button
              if (actionLabel != null && onAction != null) ...[
                SizedBox(width: 40.w),
                TextButton(
                  onPressed: () {
                    // Cancel the auto‐dismiss timer
                    timer?.cancel();
                    // Remove now
                    entry.remove();
                    // Run the action
                    onAction();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: AppText(
                    text: actionLabel,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    ),
  );

  overlay.insert(entry);
  timer = Timer(duration, () {
    entry.remove();
  });
}
