const { merge } = require("webpack-merge");
const production = require("./webpack.production");

module.exports = merge(production, {});