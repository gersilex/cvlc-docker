CVLC Docker Image
=================

This is a very simple, yet powerful Docker image containing the Video Lan Client and all of its registered dependencies on Alpine. While not everything is needed and you probably won't use it in a GUI, it's a perfect fit for streaming, recording and transcoding operations.

It is intended to use the console variant of VLC. Feel free to override the ENTRYPOINT if you want to use the `vlc` binary instead of `cvlc`.

Example Usage
-------------

In this example I transcode an ONVIF RTSP stream of a security camera to MotionJPEG (mjpeg) to make it natively available on browsers for my security dashboard.

```sh
docker run -p 10001:8080 gersilex/cvlc rtsp://192.168.13.150/user=camera_password=xxxxxx_channel=1_stream=0.sdp --sout '#transcode{vcodec=MJPG,venc=ffmpeg{strict=1}}:standard{access=http{mime=multipart/x-mixed-replace;boundary=--7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:8080/}'
```

Open up http://127.0.0.1:10001/ to view the mjpeg stream of embed it as image for any modern browser.

Where to get the URL
--------------------

Most IP cameras make use of [a standard by the ONVIF forum](https://en.wikipedia.org/wiki/ONVIF), that makes discovery and usage very easy. There are plenty of discovery and setup applications available for many operating system.

Attributions
------------

Thanks to [Hokusai for his StackOverflow post](https://stackoverflow.com/a/43963794/1451557) showing a working example for Windows.

License
-------

MIT
