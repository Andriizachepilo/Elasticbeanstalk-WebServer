require('dotenv').config();

module.exports = {
  mongoURI: `${process.env.DB}`
};

