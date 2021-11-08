const form = document.getElementById("addBook");
const submitBtn = document.getElementsByClassName("add-book-submit")[0];
const ratingInput = document.getElementsByName("rating")[0];
const genreSelect = document.getElementsByName("genre")[0];
const newGenreLabel = document.get;
ratingInput.addEventListener("change", function () {
  const msg = document.getElementsByClassName("msg")[0];
  const originalMsg = msg.innerHTML;
  if (this.value > 5 || this.value < 0) {
    msg.innerHTML = "You selected an invalid rating";
    msg.classList.add("red");
    submitBtn.disabled = true;
  } else {
    msg.innerHTML = "(Choose a value from 1 to 5)";
    msg.classList.remove("red");
    submitBtn.disabled = false;
  }
});

const openGenreAdder = (event) => {
  const selectVal = event.target.value;
  const inactiveEl = [...document.getElementsByClassName("inactive")];
  if (selectVal === "Other") {
    inactiveEl.forEach((item) => item.classList.remove("inactive"));
  } else {
    inactiveEl.forEach((item) => item.classList.add("inactive"));
  }
};

genreSelect.addEventListener("change", openGenreAdder);
