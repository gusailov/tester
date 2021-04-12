document.addEventListener("turbolinks:load", function () {
  let password_field = document.getElementById("user_password");
  let confirmation_password_field = document.getElementById(
    "user_password_confirmation"
  );

  if (password_field && confirmation_password_field) {
    password_field.addEventListener("input", passwordsCheck);
    confirmation_password_field.addEventListener("input", passwordsCheck);
  }
  function passwordsCheck() {
    let alert = document.querySelector(".octicon-alert");
    let check_circle = document.querySelector(".octicon-check-circle");

    if (password_field.value == confirmation_password_field.value) {
      alert.classList.add("d-none");
      check_circle.classList.remove("d-none");
    }
    if (
      password_field.value != confirmation_password_field.value &&
      confirmation_password_field.value.length > 0
    ) {
      alert.classList.remove("d-none");
      check_circle.classList.add("d-none");
    }
  }
});
