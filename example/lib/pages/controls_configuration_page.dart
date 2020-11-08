import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';

class ControlsConfigurationPage extends StatefulWidget {
  @override
  _ControlsConfigurationPageState createState() =>
      _ControlsConfigurationPageState();
}

class _ControlsConfigurationPageState extends State<ControlsConfigurationPage> {
  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerControlsConfiguration controlsConfiguration =
        BetterPlayerControlsConfiguration(
      controlBarColor: Colors.indigoAccent.withAlpha(200),
      iconsColor: Colors.lightGreen,
      playIcon: Icons.forward,
      progressBarPlayedColor: Colors.grey,
      progressBarHandleColor: Colors.lightGreen,
      enableSkips: false,
      enableFullscreen: false,
      controlBarHeight: 60,
    );

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            fit: BoxFit.contain,
            controlsConfiguration: controlsConfiguration);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.NETWORK, Constants.forBiggerBlazesUrl);
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controls configuration"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Player with customized controls via BetterPlayerControlsConfiguration.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
        ],
      ),
    );
  }
}
