var express = require("express");
var router = express.Router();
var database = require('../database/connection').dbConnection;


router.get('/', (req, res) => { //sends recipes.ejs with all recipes organized by protein

  sql = 'SELECT name, description, protein FROM recipes;'
  database.query(sql, (err, result) => { //get all names and descriptions of recipes
    if (err) throw err;

    //bucket the recipes by protein
    recipesByProtein = {};
    result.forEach((recipe, index) => { // get every unique protein
      if (!Object.keys(recipesByProtein).includes(recipe.protein)){
        recipesByProtein[recipe.protein] = [recipe];
      }
      else{
        recipesByProtein[recipe.protein].push(recipe);
      }
    });
    console.log(recipesByProtein);

    res.render('recipes', { recipesByProtein} ); // Pass the recipes organized by protein type
  });
});

router.get('/addrecipe', (req, res) => {
  sql = 'SELECT * FROM ingredients';
  database.query(sql, (err, result) => {
    if (err) throw err;
    let ingredients = result;
    res.render('addrecipe', { ingredients });
  });
});

router.post("/addfood", (req, res) => {
  console.log(req.body);

  let sql = "sqlcommandhere"
});

//test DB connection
router.get('/db', (req, res) => {
  database.query('SELECT * FROM ingredients;', (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send(result);
  })
});



module.exports = router;