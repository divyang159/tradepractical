import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../models/stock_model.dart';

class StockTile extends StatelessWidget {
  final StockModel stock;
  final bool isReordering;

  const StockTile({
    super.key,
    required this.stock,
    this.isReordering = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPositive = stock.changePercent >= 0;
    final Color changeColor = isPositive ? AppColors.positiveChange : AppColors.negativeChange;
    final String sign = isPositive ? '+' : '';

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stock.name,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  'NYSE', // mock exchange
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          if (!isReordering)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${stock.price.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 4.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: changeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    '$sign${stock.changePercent.toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: changeColor,
                        ),
                  ),
                ),
              ],
            )
          else
            Icon(
              Icons.drag_handle,
              color: AppColors.textSecondary,
              size: 24.w,
            ),
        ],
      ),
    );
  }
}
