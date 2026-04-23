import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import '../widgets/stock_tile.dart';

class ReorderWatchlistScreen extends StatelessWidget {
  const ReorderWatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primary, size: 24.w),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppStrings.reorderTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          BlocBuilder<WatchlistBloc, WatchlistState>(
            builder: (context, state) {
              if (state is WatchlistLoaded && state.tempStocks != null) {
                return TextButton(
                  onPressed: () {
                    context.read<WatchlistBloc>().add(CommitReorder());
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoaded && state.tempStocks != null) {
            final list = state.tempStocks!;

            return ReorderableListView.builder(
              padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
              itemCount: list.length,
              onReorder: (oldIndex, newIndex) {
                context.read<WatchlistBloc>().add(UpdateTempOrder(oldIndex, newIndex));
              },
              proxyDecorator: (child, index, animation) {
                return Material(
                  color: Colors.transparent,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.5),
                  child: child,
                );
              },
              itemBuilder: (context, index) {
                final stock = list[index];
                return Container(
                  key: ValueKey(stock.id),
                  child: StockTile(
                    stock: stock,
                    isReordering: true,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
