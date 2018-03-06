const memory = new WebAssembly.Memory({initial:1});

const consoleLogString = (offset, length) => {
  var bytes = new Uint8Array(memory.buffer, offset, length);
  var string = new TextDecoder('utf8').decode(bytes);
  console.log(string);
}

/* call from wasm */
const importObject = {
  console: {
    log: function(arg) {
      console.log(arg);
    },
    logString: consoleLogString,
  },
  js: {
    mem: memory
  }
};

fetchAndInstantiate('./app.wasm', importObject).then(function(instance) {
  console.log(instance.exports.add(1, 2));         // 3
  console.log(instance.exports.getAnswerPlus1());  // 43
  instance.exports.logIt();                        // 100
  instance.exports.writeHi();                      // "Hi"
  console.log(instance.exports.callByIndex(0));    // returns 42
  console.log(instance.exports.callByIndex(1));    // returns 13
  console.log(instance.exports.callByIndex(2));
});
