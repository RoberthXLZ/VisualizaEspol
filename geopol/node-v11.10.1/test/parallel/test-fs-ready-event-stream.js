'use strict';
const common = require('../common');
const assert = require('assert');
const fs = require('fs');
const path = require('path');
const tmpdir = require('../common/tmpdir');

const readStream = fs.createReadStream(__filename);
assert.strictEqual(readStream.pending, true);
readStream.on('ready', common.mustCall(() => {
  assert.strictEqual(readStream.pending, false);
}));

const writeFile = path.join(tmpdir.path, 'write-fsreadyevent.txt');
tmpdir.refresh();
const writeStream = fs.createWriteStream(writeFile, { autoClose: true });
assert.strictEqual(writeStream.pending, true);
writeStream.on('ready', common.mustCall(() => {
  assert.strictEqual(writeStream.pending, false);
}));
