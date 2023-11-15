import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_clone/common_components/base_widget/base_controller.dart';
import 'dart:developer' as developer;
import 'package:youtube_clone/common_components/custom_text.dart';

abstract class BaseWidget<T extends BaseController> extends StatelessWidget {
  const BaseWidget(T baseController, {super.key})
      : _baseController = baseController;

  final T _baseController;

  bool _isInitialized(BuildContext context) {
    try {
      Provider.of<T>(context, listen: false);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isInitialized(context)) {
      context.read<T>().onInit();
      developer.log(
        '${toString()} start with Controller: ${_baseController.runtimeType}',
        name: 'Provider',
      );
      return _futurebuilder(context);
    } else {
      return ChangeNotifierProvider<T>(
        create: (_) => _baseController,
        builder: (context, __) {
          context.read<T>().onInit();
          developer.log(
            '${toString()} start with Controller: ${_baseController.runtimeType}',
            name: 'Provider',
          );
          return _futurebuilder(context);
        },
      );
    }
  }

  Widget _futurebuilder(BuildContext context) {
    return Consumer<T>(
      builder: (_, baseController, __) {
        if (baseController.getData.isEmpty) {
          return FutureBuilder<Map<String, List<Map<String, Object?>?>?>?>(
            future: baseController.loadData(),
            builder: (_,
                AsyncSnapshot<Map<String, List<Map<String, Object?>?>?>?>
                    snapshot) {
              developer.log(
                '${toString()} rebuild new data',
                name: 'Provider',
              );
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, List<Map<String, Object?>?>?>? data = snapshot.data;
                if (data != null && data.isEmpty) {
                  developer.log(
                    '${toString()} data is empty return getEmptyView',
                    name: 'Provider',
                  );
                  return getEmptyView(context);
                }
                data ??= {};
                baseController.setData(data);
                onReady(context, context.read<T>());
                return getMainView(context, baseController);
              } else if (snapshot.hasError) {
                developer.log(
                  '${toString()} has error return getErrorView message: ${snapshot.error}',
                  name: 'Provider',
                );
                return getErrorView(context);
              } else {
                developer.log(
                  '${toString()} ConnectionState.waiting return getSkeletonsView',
                  name: 'Provider',
                );
                return getSkeletonView(context);
              }
            },
          );
        }
        return getMainView(context, baseController);
      },
    );
  }

  Widget getSkeletonView(BuildContext context) {
    developer.log(
      '${toString()} build skeleton view',
      name: 'Provider',
    );
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double heightItem = 150;
            final double height = constraints.maxHeight != double.infinity
                ? constraints.maxHeight
                : heightItem;
            final double width = constraints.maxWidth;
            if (heightItem > height) {
              heightItem = height;
            }
            final int count = height ~/ heightItem;
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: count,
              itemBuilder: (_, __) => SizedBox(
                height: heightItem,
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).cardTheme.color,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardTheme.color,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Theme.of(context).cardTheme.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardTheme.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardTheme.color,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget getErrorView(BuildContext context) {
    return const Center(
        child: CustomText.bodyMedium(
      'Có một số lỗi đã xảy ra!',
      textAlign: TextAlign.center,
    ));
  }

  Widget getEmptyView(BuildContext context) {
    return const Center(
        child: CustomText.bodyMedium(
      'Có một số lỗi đã xảy ra, dữ liệu lấy về rỗng.',
      textAlign: TextAlign.center,
    ));
  }

  void onReady(
    BuildContext context,
    T baseController,
  ) {
    baseController.onReady();
    developer.log(
      '${toString()} done process return getMainView',
      name: 'Provider',
    );
  }

  Widget getMainView(
    BuildContext context,
    T baseController,
  );
}
