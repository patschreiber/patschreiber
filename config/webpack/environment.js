const { environment } = require('@rails/webpacker')

// const fileLoader = {
//   test: /\.(png|svg|jpg|gif)$/,
//   use: [
//     'file-loader',
//   ],
// }

// environment.loaders.insert('file-loader', fileLoader, { before: 'style' })

const hamlLoader = { test: /\.html\.hamlc$/, loader: "haml" }

module.exports = environment

