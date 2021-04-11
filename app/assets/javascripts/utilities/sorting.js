document.addEventListener("turbolinks:load", function () {
  let control = document.querySelector(".sort-by-title");

  if (control) {
    console.log("control", control);
    control.addEventListener("click", sortRowsByTitle);
  }
});

function sortRowsByTitle() {
  let table = document.querySelector("table");
  let rows = table.querySelectorAll("tr");
  let sortedRows = [];

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i]);
  }
  sortedRows.sort(compareRows);

  let sortedTable = document.createElement("table");
  let body = sortedTable.createTBody();

  sortedTable.classList.add(
    "table",
    "table-success",
    "table-striped",
    "align-middle"
  );

  body.appendChild(rows[0]);

  for (let i = 0; i < sortedRows.length; i++) {
    body.appendChild(sortedRows[i]);
  }

  table.parentNode.replaceChild(sortedTable, table);
}

function compareRows(row1, row2) {
  let testTitle1 = row1.querySelector("td").textContent;
  let testTitle2 = row2.querySelector("td").textContent;
  if (testTitle1 < testTitle2) {
    return -1;
  }
  if (testTitle1 > testTitle2) {
    return 1;
  }
  return 0;
}
