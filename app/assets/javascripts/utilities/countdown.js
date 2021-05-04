document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector("#countdown");
  if (!control) {
    sessionStorage.removeItem("time");
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

    let countdown = setInterval(countdownUpdate, 1000);

    function redirect() {
      let next_btn = document.querySelector("#next_btn");
      let time_is_over = document.querySelector("#time_is_over");
      time = 0;
      clearInterval(countdown);
      next_btn.classList.add("disabled");
      time_is_over.classList.remove("d-none");
      setTimeout(() => {
        url = window.location.href;
        window.location.assign(`${url}/result`);
      }, 2000);
    }
  }
});
