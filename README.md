# A Web Assembly example app


To compile .wat text file
```shell
yarn build
```

Run server
```shell
yarn run
```

open http://localhost:8080

## Directory structure overview 
```
.
├── README.md
├── bin  <----------------- Emscripten tools bin dir
│   ├── spectest-interp
│   ├── wabt-unittests
│   ├── wasm-interp
│   ├── wasm-link
│   ├── wasm-objdump
│   ├── wasm-opcodecnt
│   ├── wasm-validate
│   ├── wasm2c
│   ├── wasm2wat
│   ├── wast2json
│   ├── wat-desugar
│   └── wat2wasm
├── package.json
├── public
│   ├── app.wasm <--------- Web Assembly compiled binary file
│   ├── index.html
│   └── javascript
│       ├── app.js
│       └── fetch.js
├── src
│   └── app.wat <---------- Web Assembly text module file
└── yarn.lock
```
