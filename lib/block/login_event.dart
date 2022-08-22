// Это простой абстрактный класс 
// который можно расширить для других событий 
abstract class LoginEvent {
  const LoginEvent();
}


class LoginButtonTappedEvent extends LoginEvent {}
class ShowSnackBarButtonTappedEvent extends LoginEvent {}
