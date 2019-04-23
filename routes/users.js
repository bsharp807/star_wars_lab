var express = require('express');
var router = express.Router();
const SqlRunner = require ('../db/sql_runner');

/* GET users listing. */
router.get('/', function(req, res) {
  SqlRunner.run('SELECT * FROM characters').then((result) =>{
    res.status(200).json(result.rows);
  })
});
// CREATE
router.post('/', function(req, res) {
  SqlRunner.run('INSERT INTO characters (name, darkside, age) VALUES ($1, $2, $3)', [req.body.name,req.body.darkside, req.body.age])
  .then((result) =>{
    res.status(200).json(result)
  });
});

//UPDATE
router.put('/:id', function(req,res) {
  SqlRunner.run('UPDATE characters SET name = $1, darkside = $2, age = $3 WHERE id = $4', [req.body.name, req.body.darkside, req.body.age, req.params.id])
  .then((result) => {
    res.status(200).json(result)
  });
});

// DELETE
router.delete('/:id', function(req, res) {
  SqlRunner.run('DELETE FROM characters WHERE id = $1', [req.params.id])
  .then((result) => {
    res.status(200).json(result)
  });
});

// DAKRSIDE GET
router.get('/darkside', function(req, res) {
  SqlRunner.run('SELECT * FROM characters WHERE darkside = true').then((result) => {
    res.status(200).json(result.rows);
  });
})

// CHARS AND LIGHTSABER
router.get('/lightsaber', function(req, res) {
  SqlRunner.run('SELECT characters.name, lightsaber.colour FROM characters INNER JOIN lightsaber ON lightsaber.owner_id = characters.id').then((result) => {
    res.status(200).json(result.rows)
  });
});

module.exports = router;
