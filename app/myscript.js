const mongoose = require('mongoose');
const db = require('./config/database');
require('dotenv').config();

mongoose.connect(db.mongoURI, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('MongoDB connected...');
    process.exit(0); 
}).catch(err => {
    console.log(err);
    process.exit(1); 
});
