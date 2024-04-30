const express = require('express');
const path = require('path');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const methodOverride = require('method-override');
const flash = require('connect-flash');
const session = require('express-session');
const mongoose = require('mongoose');
const app = express();
const passport = require('passport');


const todos = require('./routes/todos');
const users = require('./routes/users');


require('./config/passport')(passport);


const db = require('./config/database');


mongoose.connect(db.mongoURI, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('MongoDB connected...');
}).catch(err => {
    console.log(err);
});


app.engine('handlebars', exphbs({
    defaultLayout: 'main'

}));
app.set('view engine', 'handlebars');


app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());


app.use(express.static(path.join(__dirname, 'public')));


app.use(methodOverride('_method'));


app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true

}));


app.use(passport.initialize());
app.use(passport.session());


app.use(flash());



app.use(function(req, res, next) {
  res.locals.success_msg = req.flash('success_msg'); 
  res.locals.error_msg = req.flash('error_msg');     
  res.locals.error = req.flash('error');            
  res.locals.user = req.user || null;               
  next();
})

app.get('/', (req, res) => {
    const title='Welcome to ToDoNow!';
    res.render('index', {
       title: title
   });
});

app.get('/about', (req,res) => {
   res.render('about');
});


// routes
app.use('/users', users);
app.use('/todos', todos);

const port = process.env.PORT || 3001;

app.listen(port, () => {
   console.log(`listening on port ${port}`);
});
