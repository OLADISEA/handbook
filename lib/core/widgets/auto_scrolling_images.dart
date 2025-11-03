import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AutoScrollImageRow extends StatefulWidget {
  final String imagePath1;
  final String imagePath2;

  const AutoScrollImageRow({
    super.key,
    required this.imagePath1,
    required this.imagePath2,
  });

  @override
  State<AutoScrollImageRow> createState() => _AutoScrollImageRowState();
}

class _AutoScrollImageRowState extends State<AutoScrollImageRow> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  bool _scrollToSecond = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if (_scrollController.hasClients) {
        double targetOffset = _scrollToSecond
            ? _scrollController.position.maxScrollExtent
            : 0.0;

        await _scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );

        _scrollToSecond = !_scrollToSecond;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 196.h,
      width: 390.w,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Image.asset(widget.imagePath1),
          SizedBox(width: 8.w),
          Image.asset(widget.imagePath2),
        ],
      ),
    );
  }
}

