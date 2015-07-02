path = require('path');
express = require('express');
app = express();
app.disable('x-powered-by');
app.use(express.static(path.join(__dirname, 'public/')));

var root = path.join(__dirname, 'public/index.html');

app.get('/*', function(req, res) {
  res.sendFile(root);
});

app.listen(5000);
