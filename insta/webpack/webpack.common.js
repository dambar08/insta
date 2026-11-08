const path = require("path");
const webpack = require("webpack");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");

module.exports = (env = {}) => {
  const environment =
    env.environment || process.env.APP_ENV || "development";

  const isStaging = environment === "staging";
  const isProduction = environment === "production";

  if (!["development", "staging", "production"].includes(environment)) {
    throw new Error(`Unknown environment: ${environment}`);
  }

  return {
    context: path.resolve(__dirname, ".."),
    mode: "development",
    watch: true,
    devtool: "eval-source-map",
    entry: {
      application: "./app/javascript/application.js",
    },
    output: {
      iife: false,
      filename: "[name].js",
      sourceMapFilename: "[file].map",
      path: path.resolve(__dirname, "../app/assets/builds"),
      clean: true
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
          ],
          exclude: /node_modules/,
        },
        {
          test: /\.css$/,
          use: [
            "css-loader",
            "postcss-loader",
          ],
        },
        {
          test: /\.(sa|sc)ss$/,
          exclude: /node_modules/,
          use: [
            "css-loader",
            "postcss-loader",
            "sass-loader",
          ],
        },
        {
          test: /\.(woff2?|ttf|eot|otf|svg)$/,
          type: 'asset/resource',
          generator: {
            filename: 'fonts/[name][hash][ext]'
          }
        },
        {
          test: /\.(png|jpe?g|gif)$/i,
          type: 'asset/resource',
          generator: {
            filename: 'images/[name][hash][ext]'
          }
        }
      ],
    },
    optimization: {
      minimize: false,
      minimizer: [
        "...",
      ],
      splitChunks: {
        chunks: "all",
      },
    },
    plugins: [
      new ForkTsCheckerWebpackPlugin(),
      new webpack.optimize.LimitChunkCountPlugin({
        maxChunks: 1,
      }),
      new webpack.DefinePlugin({
        "process.env.APP_ENV": JSON.stringify(environment),
      }),
    ],
    watchOptions: {
      ignored: /node_modules/,
    },
  }
};
