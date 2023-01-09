const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  darkMode: 'class',
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,haml,html,slim}",
  ],

  theme: {
    extend: {
      backgroundcolor: {
        'primary': '#3182ce',
        'primary-dark': {
          light: '#2c5282',
          dark: '#0c2c54'
        },
      },

      variants: {
        backgroundColor: ['dark', 'dark-hover', 'dark-group-hover'],
        textColor: ['dark', 'dark-hover', 'dark-active'],
        borderColor: ['dark', 'dark-focus', 'dark-focus-within'],
      },

      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },

      plugins: [
        require("@tailwindcss/forms"),
        require("@tailwindcss/aspect-ratio"),
        require("@tailwindcss/typography"),
      ],

    },
  },
};