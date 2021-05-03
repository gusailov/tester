document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector("#countdown");
  if (!control) {
    clearInterval();
    sessionStorage.setItem("time", 0);
  }
  if (control) {
    const startingValue = control.dataset.countdownValue;
    let time =
      sessionStorage.getItem("time") <= 0
        ? startingValue * 60
        : sessionStorage.getItem("time");

    function countdownUpdate() {
      let minutes = Math.floor(time / 60);
      let seconds = time % 60;
      seconds = seconds < 10 ? "0" + seconds : seconds;
      minutes = minutes < 10 ? "0" + minutes : minutes;
      control.textContent = `${minutes}:${seconds}`;
      time--;
      if (time <= 0) {
        clearInterval((time = 0));
      }
      sessionStorage.setItem("time", time);
    }
    setInterval(countdownUpdate, 100);
  }
});
