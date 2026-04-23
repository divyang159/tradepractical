import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_strings.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_text_styles.dart';
import 'features/watchlist/bloc/watchlist_bloc.dart';


void main() {
  runApp(const TradePracticalApp());
}

class TradePracticalApp extends StatelessWidget {
  const TradePracticalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X/11/12 standard design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => WatchlistBloc()),
          ],
          child: MaterialApp.router(
            title: AppStrings.appName,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.background,
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
                brightness: Brightness.dark,
              ),
              textTheme: AppTextStyles.textTheme,
              useMaterial3: true,
            ),
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
