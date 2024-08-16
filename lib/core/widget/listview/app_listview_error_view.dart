import 'package:flutter/material.dart';



class AppListViewErrorView extends StatelessWidget {
  final String errorText;

  const AppListViewErrorView({required this.errorText, super.key});

  @override
  Widget build(final BuildContext context) => Center(
      child: Text(errorText, style: Theme.of(context).textTheme.displayMedium));
}
