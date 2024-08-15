import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamdars/app/app_constants.dart';
import 'package:hamdars/core/utils/ext.dart';
import 'package:hamdars/core/widget/bottom_sheet.dart';
import 'package:hamdars/core/widget/divider_widget.dart';
import 'package:hamdars/generated/l10n.dart';
import 'package:hamdars/presentation/cubit/language/language_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late LanguageCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<LanguageCubit>(context);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<LanguageCubit, LanguageState>(
              builder: (final BuildContext context, final LanguageState state) => ListTile(
                  onTap: () {
                    BottomSheetWidget().show(
                      context,
                      S.of(context).languages,
                      ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (
                          final BuildContext context,
                          final int index,
                        ) =>
                            ListTile(
                          onTap: () {
                            context.pop();
                            cubit.change(AppConstants.languages()[index]);
                          },
                          leading: Text(
                            AppConstants.languages()[index].name,
                          ),
                        ),
                        separatorBuilder: (
                          final BuildContext context,
                          final int index,
                        ) =>
                            DividerWidget().horizontal(),
                        itemCount: AppConstants.languages().length,
                      ),
                    );
                  },
                  leading: Text(
                    S.of(context).language,
                  ),
                  trailing: Text(cubit.language.name),
                ),
            )
          ],
        ),
      ),
    );
}
