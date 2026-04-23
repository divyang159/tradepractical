import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import '../widgets/stock_tile.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  void initState() {
    super.initState();
    final state = context.read<WatchlistBloc>().state;
    if (state is WatchlistInitial || state is WatchlistError) {
      context.read<WatchlistBloc>().add(LoadWatchlist());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          AppStrings.watchlistTitle,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.primary, size: 24.w),
            onPressed: () {
              context.push(AppRoutes.reorder);
            },
          ),
        ],
      ),
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is WatchlistLoaded) {
            if (state.stocks.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.emptyWatchlist,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return ListView.builder(
              padding: EdgeInsets.only(top: 8.h, bottom: 24.h),
              itemCount: state.stocks.length,
              itemBuilder: (context, index) {
                return StockTile(stock: state.stocks[index]);
              },
            );
          } else if (state is WatchlistError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.negativeChange,
                    ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
