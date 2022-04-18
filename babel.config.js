// Having a separate babel.config.js file, rather than including Babel's
// configuration in package.json or webpack.config.js, allows for example Jest
// to properly transpile the test scripts before running them
module.exports = function (api) {
  // TODO[setup]: Check that this cache works properly
  // TODO[setup]: Is  api.cache.forever() redundant with cacheDirectory in
  //       babel.config.js?
  api.cache.forever()

  return {
    // TODO[setup]: Optimize Babel configuration
    presets: ['@babel/preset-env'],
  }
}
