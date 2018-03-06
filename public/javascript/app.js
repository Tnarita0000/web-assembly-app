fetchAndInstantiate('./app.wasm').then(function(instance) {
  console.log(instance.exports.add(1, 2));         // "3"
  console.log(instance.exports.getAnswerPlus1());  // "43"
});
