import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();
  
  @override
  List<Object?> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoading extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<StockModel> stocks;
  final List<StockModel>? tempStocks;

  const WatchlistLoaded(this.stocks, {this.tempStocks});

  @override
  List<Object?> get props => [stocks, tempStocks];
  
  WatchlistLoaded copyWith({
    List<StockModel>? stocks,
    List<StockModel>? tempStocks,
  }) {
    return WatchlistLoaded(
      stocks ?? this.stocks,
      tempStocks: tempStocks ?? this.tempStocks,
    );
  }
}

class WatchlistError extends WatchlistState {
  final String message;

  const WatchlistError(this.message);

  @override
  List<Object?> get props => [message];
}
