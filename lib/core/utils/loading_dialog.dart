import 'package:flutter/material.dart';

import '../widgets/loaders/loading_screen.dart';


bool _isLoadingDialogVisible = false;

void showLoadingDialog(BuildContext context) {
  if (_isLoadingDialogVisible) return;
  _isLoadingDialogVisible = true;

  showDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    barrierColor: Colors.transparent,
    builder: (ctx) => WillPopScope(
      onWillPop: () async => false,
      child: const LoadingScreen(),
    ),
  );
}

void hideLoadingDialog(BuildContext context) {
  if (!_isLoadingDialogVisible) return;
  _isLoadingDialogVisible = false;

  try {
    Navigator.of(context, rootNavigator: true).pop();
  } catch (e) {
  }
}
