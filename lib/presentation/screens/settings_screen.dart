import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubits/settings_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = "/settings";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App Settings'),
        ),
        body: BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
            final notification = SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              duration: const  Duration(seconds: 4),
              content: Text(
                'App Notification: ${state.appNotifications} | Email Notification: ${state.emailNotifications}',
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(notification);
          },
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  SwitchListTile(
                    title: const Text('App Notifications'),
                    value: state.appNotifications,
                    onChanged: (newValue) => context
                        .read<SettingsCubit>()
                        .toggleAppNotifications(newValue),
                  ),
                  SwitchListTile(
                    title: const Text('Email Notifications'),
                    value: state.emailNotifications,
                    onChanged: (newValue) => context
                        .read<SettingsCubit>()
                        .toggleEmailNotifications(newValue),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
