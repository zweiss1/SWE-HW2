var express = require("express");
var router = express.Router();

router.get('/', (req, res) => {
    res.render("addrecipe");
});

router.post("/addfood", (req, res) => {
    console.log(req.body);
  
    let sql = "sqlcommandhere"
  });

module.exports = router;