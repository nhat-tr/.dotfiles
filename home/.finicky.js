module.exports = {
  defaultBrowser: {
      name: "Safari",
  },
  handlers: [
    {
      match: [ '*localhost*' ],
      browser: { name: "Chrome" }
    },
  ],
};
