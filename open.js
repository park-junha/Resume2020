#!/usr/bin/env node

const _ = require('child_process');
_.exec(`open -a "Google Chrome" ${__dirname}/index.html`, (err) => {
  if (err) {
    console.error('ERR: Could not open index.html.');
    process.exit(1);
  }
});
