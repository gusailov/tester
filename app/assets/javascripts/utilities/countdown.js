document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector("#countdown");
  if (!control) {
    sessionStorage.setItem("time", 0);
  }
  if (control) {
    const startingValue = control.dataset.countdownValue;
    let time =
      sessionStorage.getItem("time") <= 0
        ? startingValue * 60
        : sessionStorage.getItem("time");

    function countdownUpdate() {
      if (time <= 0) {
        redirect();
      }
      let minutes = Math.floor(time / 60);
      let seconds = time % 60;
      seconds = seconds < 10 ? "0" + seconds : seconds;
      minutes = minutes < 10 ? "0" + minutes : minutes;
      control.textContent = `${minutes}:${seconds}`;
      time--;
      sessionStorage.setItem("time", time);
    }
    let countdown = setInterval(countdownUpdate, 100);
    function redirect() {
      time = 0;
      clearInterval(countdown);
      setTimeout(() => {
        url = window.location.href;
        console.log(`${url}/result`);
        // window.location.assign(`${url}/result`);
      }, 2000);
    }
  }
});
