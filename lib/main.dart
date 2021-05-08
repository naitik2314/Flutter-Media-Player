import 'dart:io';

import 'package:bootcamp_media_player/audio/audio_local.dart';
import 'package:bootcamp_media_player/audio/audio_network.dart';
import 'package:bootcamp_media_player/video/video_assets.dart';
import 'package:bootcamp_media_player/video/video_file.dart';
import 'package:bootcamp_media_player/video/video_network.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'audio/audio_assets.dart';
import 'brand_colors.dart';
import 'widgets/TaxiButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  _pickVideoFileFrom(context) async {
    File videoFile = await FilePicker.getFile(type: FileType.VIDEO);
    if (videoFile == null) {
      print("Video Picked is null");
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return VideoFile(
        file: videoFile,
      );
    }));
  }

  _pickAudioFileFrom(context) async {
    File audioFile = await FilePicker.getFile(type: FileType.AUDIO);
    if (audioFile == null) {
      print("Audio Picked is null");
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return AudioLocal(
        file: audioFile,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('assets/video-player.png'),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Media Player',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                SizedBox(
                  height: 16,
                ),
                TaxiButton(
                  title: 'Play Video From Internet',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return VideoNetwork();
                    }));
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TaxiButton(
                  title: 'Play Video From Assets',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return VideoAssets();
                    }));
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TaxiButton(
                  title: 'Play Video From Local',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    _pickVideoFileFrom(context);
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TaxiButton(
                  title: 'Play Audio From Network',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AudioNetwork();
                    }));
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TaxiButton(
                  title: 'Play Audio From Assets',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return AudioAssets();
                    }));
                  },
                ),
                SizedBox(
                  height: 16.0,
                ),
                TaxiButton(
                  title: 'Play Audio From Local',
                  color: BrandColors.colorPrimaryDark,
                  onPressed: () {
                    _pickAudioFileFrom(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
