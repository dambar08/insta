const path = require("path");
const webpack = require("webpack");
const ForkTsCheckerWebpackPlugin = require("fork-ts-checker-webpack-plugin");
const ImageMinimizerPlugin = require("image-minimizer-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const path = require("path");
const { merge } = require("webpack-merge");
const common = require("./webpack.common");


module.exports = (env = {}) => {
    const environment = env.environment || process.env.APP_ENV || "development";

    if (!["production"].includes(environment)) {
        throw new Error(`Production environment is not set: ${environment}`);
    }

    return merge(common, {
        context: __dirname,
        mode: "production",
        watch: false,
        devtool: false,
        entry: {
            application: "./app/javascript/application.js",
        },
        output: {
            iife: false,
            filename: "[name].js",
            sourceMapFilename: "[file].map",
            path: path.resolve(__dirname, "app/assets/builds"),
            clean: true
        },
        resolve: {
            extensions: [".tsx", ".jsx", ".ts", ".js"],
        },
        module: {
            rules: [
                {
                    test: /\.css$/,
                    use: [
                        MiniCssExtractPlugin.loader,
                        "css-loader",
                        "postcss-loader",
                    ],
                },
                {
                    test: /\.(sa|sc)ss$/,
                    exclude: /node_modules/,
                    use: [
                        MiniCssExtractPlugin.loader,
                        "css-loader",
                        "postcss-loader",
                        "sass-loader",
                    ],
                },
            ],
        },
        optimization: {
            minimize: true,
            minimizer: [
                "...", [
                    new CssMinimizerPlugin(),
                    new ImageMinimizerPlugin({
                        minimizer: {
                            implementation: ImageMinimizerPlugin.svgoMinify,
                            options: {
                                encodeOptions: {
                                    multipass: true,
                                    plugins: ["preset-default"],
                                },
                            },
                        },
                    }),
                ]
            ],
            splitChunks: {
                chunks: "all",
            },
        },
        plugins: [
            new ForkTsCheckerWebpackPlugin(),
            new MiniCssExtractPlugin({
                filename: "[name].css",
            }),
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
    });
};
