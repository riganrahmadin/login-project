function Toggle() {
  let temp = document.getElementById("typepass");

  if (temp.type === "password") {
    temp.type = "text";
  } else {
    temp.type = "password";
  }
}
