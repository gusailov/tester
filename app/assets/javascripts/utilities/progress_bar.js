document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector(".progress-bar");

  if (control) {
    let valueNow = control.dataset.valuenow;
    let valueMax = control.dataset.valuemax;
    let count = ((valueNow * 100) / valueMax).toFixed();
    control.textContent = `${count}%`;
    control.style.width = `${count}%`;
  }
});
