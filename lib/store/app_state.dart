class AppState {
  // If these variables are objects, could possibly make more complicated states relatively cleanly...?
  final int number;

  AppState({this.number = 0});

  AppState copyWith({
    int number,
  }) {
    return AppState(
      number: number ?? this.number,
    );
  }

  factory AppState.initial() {
    return AppState(number: 0);
  }
}
