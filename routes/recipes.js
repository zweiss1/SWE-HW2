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

  //get all ingredients from the request
  const ingredients = [];
  Object.keys(req.body).forEach((key) => {
    console.log(key);
    if (key != 'name' && key != 'description' && key != 'steps'){
      //at this point, the key is either an ingredient name or 'mainprotein' mapping to another ingredient
      if (key == 'mainprotein') ingredients.push(req.body[key]);
      else ingredients.push(key);
    }
  });
  console.log(ingredients);

  // insert the new recipe into the recipe table
  let recipeQuery = `INSERT INTO recipes (name, description, instructions, protein) VALUES ("${req.body.name}", "${req.body.description}", "${req.body.steps}", "${req.body.mainprotein}");`
  
  //get a list of every recipe-ingredient pair we're adding to the junction table
  let junctions = ingredients.map((ingredient) => [req.body.name, ingredient]);
  let junctionQuery = `INSERT INTO junction (recipe_name, ingredient_name) VALUES ?`;

  // According to AI, wrapping multiple queries in a transaction lets you roll back all of them if one fails
  database.beginTransaction((err) => {
    if (err) throw err;
    console.log("Transaction initiated!");
    //send the recipe to the recipe table
    database.query(recipeQuery, (err) => {
      if (err){
        //roll back all changes from this transaction if there is an error
        return database.rollback(() => {
          throw err;
        });
      }
      console.log("Recipe query successful!");
      //connect the recipe to its ingredients
      database.query(junctionQuery, [junctions], (err) => {
        if (err){
          return database.rollback(() => {
            throw err;
          });
        }
        console.log("All queries successful!");

        database.commit((err) => {
          if (err){
            return database.rollback(() => {
              throw err;
            });
          }
          console.log("Transaction complete!");
        });
      });

    })
  });
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