document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector(".sort-by-title");
  control.addEventListener("click", sortRowsByTitle);
});

function sortRowsByTitle() {
  let table = document.querySelector("table");
  console.log("Hello Ruby", table);
}
