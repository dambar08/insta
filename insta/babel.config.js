module.exports = {
  presets: [
    "@babel/preset-env",
    // "@babel/preset-react", TODO maybe when we add rails
    ["@babel/preset-typescript", { allowDeclareFields: true }],
  ],
};
