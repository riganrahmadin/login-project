const express = require("express");
const bodyParser = require("body-parser");
const bcrypt = require("bcrypt");
const session = require("express-session");
const mysql = require("mysql2");
const path = require("path");

const app = express();
const PORT = 3000;

// Koneksi ke database
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "sistem_login",
});

db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL:", err.message);
  } else {
    console.log("Connected to MySQL database.");
  }
});

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(
  session({
    secret: "secret_key", // Ganti dengan secret key Anda
    resave: false,
    saveUninitialized: false,
  })
);

app.use(express.static(path.join(__dirname, "public")));
app.set("view engine", "ejs");

// Routes
app.get("/", (req, res) => {
  res.render("login", { error: null });
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.render("login", { error: "Username dan password wajib diisi!" });
  }

  const query = "SELECT * FROM users WHERE username = ?";
  db.query(query, [username], (err, results) => {
    if (err) {
      console.error(err.message);
      return res.render("login", { error: "Terjadi kesalahan pada server!" });
    }

    if (results.length === 0) {
      return res.render("login", { error: "Username tidak ditemukan!" });
    }

    const user = results[0];
    const isMatch = bcrypt.compareSync(password, user.password);

    if (!isMatch) {
      return res.render("login", { error: "Password salah!" });
    }

    req.session.user = user.username;
    res.redirect("/dashboard");
  });
});

app.get("/dashboard", (req, res) => {
  if (!req.session.user) {
    return res.redirect("/");
  }
  res.send(
    `<h1>Selamat datang, ${req.session.user}!</h1><a href="/logout">Logout</a>`
  );
});

app.get("/register", (req, res) => {
  res.render("register", { error: null });
});

app.post("/register", (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.render("register", {
      error: "Username dan password wajib diisi!",
    });
  }

  const hashedPassword = bcrypt.hashSync(password, 10);

  const query = "INSERT INTO users (username, password) VALUES (?, ?)";
  db.query(query, [username, hashedPassword], (err) => {
    if (err) {
      console.error(err.message);
      return res.render("register", { error: "Username sudah digunakan!" });
    }

    res.redirect("/");
  });
});

app.get("/logout", (req, res) => {
  req.session.destroy();
  res.redirect("/");
});

app.listen(PORT, () => {
  console.log(`Server berjalan di http://localhost:${PORT}`);
});
