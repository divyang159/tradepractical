import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import '../../features/watchlist/screens/watchlist_screen.dart';
import '../../features/watchlist/screens/reorder_watchlist_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const WatchlistScreen(),
    ),
    GoRoute(
      path: AppRoutes.reorder,
      builder: (context, state) => const ReorderWatchlistScreen(),
    ),
  ],
);
