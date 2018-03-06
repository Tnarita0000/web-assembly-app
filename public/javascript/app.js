const importObject = {
  console: {
    log: function(arg) {
      console.log(arg);
    }
  }
};

fetchAndInstantiate('./app.wasm', importObject).then(function(instance) {
  console.log(instance.exports.add(1, 2));         // 3
  console.log(instance.exports.getAnswerPlus1());  // 43
  instance.exports.logIt();                        // 100
});
