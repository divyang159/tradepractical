import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';
import '../models/stock_model.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistInitial()) {
    on<LoadWatchlist>(_onLoadWatchlist);
    on<StartReorder>(_onStartReorder);
    on<UpdateTempOrder>(_onUpdateTempOrder);
    on<CommitReorder>(_onCommitReorder);
  }

  Future<void> _onLoadWatchlist(
    LoadWatchlist event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(WatchlistLoading());
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    try {
      final List<StockModel> mockData = _generateMockStocks();
      emit(WatchlistLoaded(mockData));
    } catch (e) {
      emit(WatchlistError(e.toString()));
    }
  }

  void _onStartReorder(
    StartReorder event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      emit(currentState.copyWith(tempStocks: List.from(currentState.stocks)));
    }
  }

  void _onUpdateTempOrder(
    UpdateTempOrder event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      if (currentState.tempStocks != null) {
        final currentTemp = List<StockModel>.from(currentState.tempStocks!);

        int oldIndex = event.oldIndex;
        int newIndex = event.newIndex;

        if (oldIndex < newIndex) {
          // Adjust newIndex because the item will be removed from its old position before insertion
          newIndex -= 1;
        }

        final StockModel item = currentTemp.removeAt(oldIndex);
        currentTemp.insert(newIndex, item);

        emit(currentState.copyWith(tempStocks: currentTemp));
      }
    }
  }

  void _onCommitReorder(
    CommitReorder event,
    Emitter<WatchlistState> emit,
  ) {
    if (state is WatchlistLoaded) {
      final currentState = state as WatchlistLoaded;
      if (currentState.tempStocks != null) {
        emit(WatchlistLoaded(currentState.tempStocks!));
      }
    }
  }

  List<StockModel> _generateMockStocks() {
    final random = Random();
    final names = [
      'ABC Corp', 'Xylon Ltd', 'TechNova', 'Global Trade',
      'Pinnacle Inc', 'Stark Ind', 'Wayne Ent', 'Umbrella Corp',
      'Oscorp', 'Aperture Sci'
    ];

    return List.generate(10, (index) {
      final isPositive = random.nextBool();
      final changePercent = random.nextDouble() * 5 * (isPositive ? 1 : -1);
      final price = 50 + random.nextDouble() * 450;

      return StockModel(
        id: 'stock_$index',
        name: names[index],
        price: price,
        changePercent: changePercent,
      );
    });
  }
}
