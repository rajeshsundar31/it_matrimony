class AuthState {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  
  const AuthState({
    required this.email, 
    required this.password,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure
    });

  factory AuthState.initial() => AuthState(
    email: "",
    password: "",
    isSubmitting: false,
    isSuccess: false,
    isFailure: false
    );


  AuthState copyWith({String? email, String? password, bool? isSubmitting, bool? isSuccess, bool? isFailure}) {
    return AuthState(
      email: email ?? this.email, 
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure
      );

  }
}