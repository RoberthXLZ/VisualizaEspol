'use strict';

const common = require('../../common');
const storeEnv = require(`./build/${common.buildType}/store_env`);
const compareEnv = require(`./build/${common.buildType}/compare_env`);
const assert = require('assert');

// N-API environment pointers in two different modules have the same value
assert.strictEqual(compareEnv(storeEnv), true);
