import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class StartReorder extends WatchlistEvent {}

class UpdateTempOrder extends WatchlistEvent {
  final int oldIndex;
  final int newIndex;

  const UpdateTempOrder(this.oldIndex, this.newIndex);

  @override
  List<Object?> get props => [oldIndex, newIndex];
}

class CommitReorder extends WatchlistEvent {}
