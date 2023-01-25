part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final bool emailNotifications;
  final bool appNotifications;

  SettingsState({
    required this.emailNotifications,
    required this.appNotifications,
  });

  SettingsState copyWith({appNotifications, emailNotifications}) {
    return SettingsState(
      emailNotifications: emailNotifications ?? this.emailNotifications,
      appNotifications: appNotifications ?? this.appNotifications,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [emailNotifications, appNotifications];

  @override
  String toString() =>
      'SettingsState(emailNotifications:$emailNotifications,appNotifications: $appNotifications)';
}

// class SettingsInitial extends SettingsState {}
