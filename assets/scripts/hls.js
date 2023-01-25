(function () {

  if (Hls.isSupported()) {
    var video = document.getElementById('video');
    var hls = new Hls();
    // bind them together
    hls.attachMedia(video);
    // MEDIA_ATTACHED event is fired by hls object once MediaSource is ready
    hls.on(Hls.Events.MEDIA_ATTACHED, function () {
      console.log('video and hls.js are now bound together !');
    });
  }
})