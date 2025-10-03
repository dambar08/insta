/** @type {import('prettier').Config & import('prettier-plugin-tailwindcss').PluginOptions} */
export default {
  // tailwindStylesheet is for tailwind v4 css entrypoint.
  // This file should includes your theme, custom utilities, and other Tailwind configuration options
  tailwindStylesheet: "./app/assets/stylesheets/application.tailwind.css",
  plugins: ["prettier-plugin-tailwindcss"],
};
