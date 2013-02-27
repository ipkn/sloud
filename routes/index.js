
/*
 * GET home page.
 */

index = function(req, res){
  res.render('index', { title: 'Sloud' });
};

edit = function(req, res){
  res.render('edit', { title: 'Sloud'});
};

module.exports = function(app){
	app.get('/', index);
	app.get('/edit', edit);
};
