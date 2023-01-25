import _ from "./lodash.min"


ChangeTheme = {
  mounted() {
    this.handleEvent("theme", (payload) => {
      document.body.className = payload.color + " " + payload.mode;
    });
  },
};

function ChangeVideo(e) {
  id = e.detail.id
  let video = document.getElementById('video');
  let lesson = document.getElementById(id)
  console.log(lesson)
  progress = lesson.querySelector(".progress")
  // let source = document.getElementById('video-source');
  video.pause()
  // source.setAttribute('src', "/watch/" + id);
  video.load();
  video.play();
  console.log("AAAA")
  progressLoop(video, progress)
}

// const progress = document.getElementById("progress");
function progressLoop(video, progress) {
  current_background = progress.style.background
  bg = _.split(current_background, 'rgb', 3).slice(1);
  rgb = []

  bg.forEach(element => {
    let el = _.split(element, ')')
    rgb.push(_.replace(el[0], "(", ""))
  });

  let seconds = document.getElementById('progress')
  console.log(progress.style.background)
  setInterval(function () {
    video.value = Math.round(
      (video.currentTime / video.duration) * 100
    );

    // rgb(59, 130, 246) 100deg, rgb(219, 234, 254)
    progress.style.background = `conic-gradient(rgb(59, 130, 246) ${video.value * 3.6}deg, rgb(219, 234, 254) 0deg)`;
    // seconds.innerHTML = video.value + " seconds" + `conic-gradient(${rgb[0]} ${video.value * 3.6}deg, ${rgb[1]} 0deg)`;
    seconds.innerHTML = video.value + " seconds" + `conic-gradient(rgb(59, 130, 246) ${video.value * 3.6}deg, rgb(219, 234, 254) 0deg)`;
  })
}

window.addEventListener("phx:reload_video", e => ChangeVideo(e))
