/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: [
    require('tailwind'),
    require('autoprefixer'),
    require('postcss-nested')
  ]
}

module.exports = config