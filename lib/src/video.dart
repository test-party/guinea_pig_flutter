import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  // Make all parameters optional
  final bool isPlaying;
  final bool isMuted;
  final Function(bool)? onPlayChanged;
  final Function(bool)? onMuteChanged;

  const VideoScreen({
    super.key,
    this.isPlaying = false,
    this.isMuted = false,
    this.onPlayChanged,
    this.onMuteChanged,
  });

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late bool _isPlaying;
  late bool _isMuted;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.isPlaying;
    _isMuted = widget.isMuted;
    
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://pauljadam.com/demos/closed-descriptions-captions.mov'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {
          if (_isPlaying) {
            _controller.play();
          }
          _controller.setVolume(_isMuted ? 0 : 1);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
        // Add a back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              _isPlaying = false;
            } else {
              _controller.play();
              _isPlaying = true;
            }
            
            // Notify parent if callback provided
            if (widget.onPlayChanged != null) {
              widget.onPlayChanged!(_isPlaying);
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}