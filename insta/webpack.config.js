const path = require("path");
const webpack = require("webpack");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");

module.exports = {
  context: __dirname,
  mode: "production",
  watch: true,
  devtool: "source-map",
  entry: {
    application: "./app/javascript/application.js",
  },
  output: {
    iife: false,
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  resolve: {
    extensions: [".tsx", ".jsx", ".ts", ".js"],
  },
  module: {
    rules: [
      {
        test: /\.[jt]sx?$/,
        use: [
          "babel-loader",
          // {
          //   loader: "astroturf/loader",
          //   options: {
          //     extension: ".module.css", // output CSS files as .module.css
          //     cssLoaderOptions: { modules: true }, // optional, if you want CSS Modules
          //   },
          // },
        ],
        exclude: /node_modules/,
      },
      // {
      //   test: /\.css$/,
      //   use: ["style-loader", "postcss-loader"],
      //   exclude: /node_modules/,
      // },
      {
        test: /\.css$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "style-loader",
          },
          {
            loader: "css-loader",
            options: {
              importLoaders: 1,
            },
          },
          {
            loader: "postcss-loader",
          },
        ],
      },
      // {
      //   test: /\.tsx?$/,
      //   use: "ts-loader",
      //   exclude: /node_modules/,
      // },
    ],
  },
  plugins: [
    new ForkTsCheckerWebpackPlugin(),
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1,
    }),
  ],
  watchOptions: {
    ignored: /node_modules/,
  },
};
