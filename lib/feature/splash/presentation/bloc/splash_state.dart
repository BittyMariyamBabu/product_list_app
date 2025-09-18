enum SplashStatus { initial, loading, completed }

class SplashState {
  final SplashStatus status;
  final bool isLoggedIn;
  const SplashState({this.status = SplashStatus.initial,this.isLoggedIn = false});

  SplashState copyWith({SplashStatus? status, bool? isLoggedIn, bool? isUser}) {
    return SplashState(
      status: status ?? this.status,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
}
