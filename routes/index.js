var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post("./addrecipe", (req, res) => {
  console.log(req.body);

  let sql = "sqlcommandhere"
});

module.exports = router;
