const path = require("path");
const webpack = require("webpack");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");
const ImageMinimizerPlugin = require("image-minimizer-webpack-plugin");

const devMode = process.env.NODE_ENV !== "production";

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
        test: /\.(sa|sc|c)ss$/,
        exclude: /node_modules/,
        use:[
          "style-loader",
          "css-loader",
          "postcss-loader",
          "sass-loader"
        ]
        // use: [
        //   {
        //     loader: "style-loader",
        //   },
        //   {
        //     loader: "css-loader",
        //     // options: {
        //     //   modules: {
        //     //     namedExport: true,
        //     //   },
        //     //   importLoaders: 1,
        //     // },
        //   },
        //   {
        //     loader: "postcss-loader",
        //   },
        //   {
        //     loader: "sass-loader",
        //   },
        // ],
      },
      // {
      //   test: /\.(woff|woff2|eot|ttf|otf)$/i,
      //   type: "asset/resource",
      // },
      // {
      //   test: /\.(jpe?g|png|gif|svg)$/i,
      //   type: "asset",
      // },
      {
        test: /\.(woff2?|ttf|eot|otf|svg)$/,
        type: 'asset/resource',
        generator: {
          filename: 'fonts/[name][hash][ext]'
        }
      },

      // Images
      {
        test: /\.(png|jpe?g|gif)$/i,
        type: 'asset/resource',
        generator: {
          filename: 'images/[name][hash][ext]'
        }
      }
      // {
      //   test: /\.tsx?$/,
      //   use: "ts-loader",
      //   exclude: /node_modules/,
      // },
    ],
  },
  optimization: {
    minimizer: [
      "...",
      new ImageMinimizerPlugin({
        minimizer: {
          implementation: ImageMinimizerPlugin.svgoMinify,
          options: {
            encodeOptions: {
              // Pass over SVGs multiple times to ensure all optimizations are applied (False by default)
              multipass: true,
              plugins: [
                // Built-in plugin preset enabled by default
                // See: https://github.com/svg/svgo#default-preset
                "preset-default",
              ],
            },
          },
        },
      }),
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
