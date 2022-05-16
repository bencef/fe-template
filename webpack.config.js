const path = require('path');

module.exports = {
  entry: './src/Main.bs.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'main.js',
  },
  devServer: {
    port: 3000,
    host: '0.0.0.0',
    'static': {
      directory: './dist'
    }
  }
};
