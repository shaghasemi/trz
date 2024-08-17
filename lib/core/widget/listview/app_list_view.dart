import 'package:flutter/material.dart';
import 'package:hamdars/app/app_enums.dart';
import 'package:hamdars/core/utils/utils.dart';
import 'package:hamdars/core/widget/listview/app_listview_error_view.dart';
import 'package:hamdars/core/widget/listview/fading_edge_scrollview.dart';
import 'package:hamdars/generated/l10n.dart';

class AppListView<T> extends StatelessWidget {
  final List<T?> items;
  final Widget Function(BuildContext, T?, int) itemBuilder;
  final Widget? onError;
  final Widget? onLoading;
  final Widget? onEmpty;
  final CurrentState state;
  final EdgeInsetsGeometry? padding;
  final Widget? separatorBuilder;
  final ScrollController? scrollController;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final Axis scrollDirection;
  final bool isHorizontal;
  final double? itemHeight;

  const AppListView({
    super.key,
    required this.itemBuilder,
    this.items = const [],
    this.onError,
    this.onLoading,
    this.onEmpty,
    this.state = CurrentState.idle,
    this.physics = const BouncingScrollPhysics(),
    this.scrollDirection = Axis.vertical,
    this.padding,
    this.separatorBuilder,
    this.scrollController,
    this.shrinkWrap = false,
    this.isHorizontal = false,
    this.itemHeight,
  });

  @override
  Widget build(final BuildContext context) {
    if (state == CurrentState.loading) {
      return onLoading ?? const Center(child: CircularProgressIndicator());
    } else if (state == CurrentState.error) {
      return onError ??
          AppListViewErrorView(
            errorText: S.of(context).serverDownDesc,
          );
    } else if (items.isEmpty) {
      return onEmpty ?? const SizedBox.shrink();
    }
    return isHorizontal
        ? Row(
            children: [
              _listView(),
              if (state == CurrentState.loadingMore) _loadMoreLoading()
            ],
          )
        : Column(
            children: [
              _listView(),
              if (state == CurrentState.loadingMore) _loadMoreLoading()
            ],
          );
  }

  Expanded _listView() => Expanded(
      child: SizedBox(
        height: itemHeight,
        child: FadingEdgeScrollView.fromListView(
          child: ListView.separated(
            addAutomaticKeepAlives: true,
            scrollDirection: scrollDirection,
            shrinkWrap: shrinkWrap,
            controller: scrollController ?? ScrollController(),
            padding: padding ??
                const EdgeInsetsDirectional.only(
                  top: Utils.mediumSize,
                  bottom: Utils.semiGiantSize,
                  start: Utils.largeSize,
                  end: Utils.largeSize,
                ),
            physics: physics,
            itemBuilder: (
              final BuildContext listContext,
              final int index,
            ) =>
                itemBuilder(
              listContext,
              items[index],
              index,
            ),
            itemCount: items.length,
            separatorBuilder: (
              final BuildContext _,
              final int index,
            ) =>
                separatorBuilder ?? Utils.semiGiantVerticalSizedBox,
          ),
        ),
      ),
    );

  Widget simple(final BuildContext context) {
    if (state == CurrentState.loading) {
      return onLoading ?? const Center(child: CircularProgressIndicator());
    } else if (state == CurrentState.error) {
      return onError ??
          AppListViewErrorView(
            errorText: S.of(context).serverDownDesc,
          );
    } else if (items.isEmpty) {
      return onEmpty ?? const SizedBox.shrink();
    }
    return FadingEdgeScrollView.fromListView(
      child: ListView.separated(
        addAutomaticKeepAlives: true,
        scrollDirection: scrollDirection,
        shrinkWrap: shrinkWrap,
        controller: scrollController ?? ScrollController(),
        padding: padding ??
            const EdgeInsetsDirectional.only(
              top: Utils.mediumSize,
              bottom: Utils.semiGiantSize,
              start: Utils.largeSize,
              end: Utils.largeSize,
            ),
        physics: physics,
        itemBuilder: (
          final BuildContext listContext,
          final int index,
        ) =>
            itemBuilder(
          listContext,
          items[index],
          index,
        ),
        itemCount: items.length,
        separatorBuilder: (
          final BuildContext _,
          final int index,
        ) =>
            separatorBuilder ?? Utils.semiGiantVerticalSizedBox,
      ),
    );
  }

  Widget _loadMoreLoading() => const Padding(
      padding: EdgeInsetsDirectional.only(bottom: Utils.largeSize),
      child: SizedBox(
        width: Utils.semiGiantSize,
        height: Utils.semiGiantSize,
        child: Center(
          child: CircularProgressIndicator(
              // color: Get.theme.colorScheme.tertiary,
              ),
        ),
      ),
    );
}
