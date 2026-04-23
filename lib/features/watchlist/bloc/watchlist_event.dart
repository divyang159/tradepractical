import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class ReorderWatchlist extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  const ReorderWatchlist(this.oldIndex, this.newIndex);

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

class SaveWatchlist extends WatchlistEvent {
  final List<StockModel> stocks;

  const SaveWatchlist(this.stocks);

  @override
  List<Object?> get props => [stocks];
}
