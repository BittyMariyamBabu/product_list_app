enum SplashStatus { initial, loading, completed }

class SplashState {
  final SplashStatus status;
  const SplashState({this.status = SplashStatus.initial});

  SplashState copyWith({SplashStatus? status}) {
    return SplashState(status: status ?? this.status);
  }
}
