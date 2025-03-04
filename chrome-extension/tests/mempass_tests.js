var mempass;
var test;

if (typeof require == "function") {
	mempass = require('../../node-tests/mempass_node').mempass;
	test = require('../../node-tests/node_modules/unit.js');
} else {
	mempass = new MemPass();
	test = unitjs;
}

var reseed = "2289146dc04e35c66958e75792142c2edb9793072002aa160ea08ae664ee95c0|1.1.1.0.!@#$%^`~&*(=_{+}";
var seed = "2289146dc04e35c66958e75792142c2edb9793072002aa160ea08ae664ee95c0";
var expected = "=&#F!+}^~de2+_2&d8{(&3d2@f+eb3f2c+cd5e&*23-> less <-a&bd%`cd$d&d3e8019a9bf";
var value = "mempass";




describe("MemPass Tests", function () {

	var passwordResult = null;
	var sha256result = null;
	var intialHash = null;
	var newSeed = null;

	before(function(done) {

		while (mempass.readyState() != mempass.READY) {

		}

		mempass.setSeed(seed);
		mempass.getOptions().reset();

		done();
	});

	before(function(done) {

		mempass.getIntialHash(value, function (err, result) {

			intialHash = result;
			done();
		});
	});

	before(function(done) {

		mempass.generate(value, function (err, result) {

			if (err) {

				passwordResult = err;
			} else {
				
				passwordResult = result;
			}
			done();
		});
	});

	before(function(done) {

		mempass.sha256(value, function (err, result) {

			if (err) {

				sha256result = err;
			} else {
				
				sha256result = result;
			}
			done();
		});
	});

	before(function(done) {

		mempass.newSeed(function (err, value) {

			newSeed = value;
			done();
		});
	});

	it("Check New Seed", function () {

		test.string(newSeed).isNotEmpty();
	});

	it("Check Intial Value", function () {

		var expected = "mempass-ssapmem-|" + seed + ".)";
		test.string(mempass.getIntialValue(value)).is(expected);
	});

	it("Check Intial Hash", function () {

		var expected = "f7cfd42bede24827d8a373d25f4eb3f2c4cd5e7123a7bd96cd0d7d3e8019a9bf";
		test.string(intialHash).is(expected);

	});

	it("Check SHA256", function () {

		var expected = "15c0358bdf1c6c662fa77f7ad8118ed01aa8f2a4b16e7dcb9f5c881f19ee1f4c";
		test.string(sha256result).is(expected);

	});

	it("Check Basic Algorythm", function () { 

		test.string(passwordResult).is(expected);
	});

	it("Check String Reverse", function () {

		test.string(mempass.stringReverse("Reversed String Value *")).is("* eulaV gnirtS desreveR");
	});

	it("Check String Sum", function () {

		test.number(mempass.stringSum("abc")).is(294);
	});

	it("Check String Sum 2", function () {

		test.number(mempass.stringSum("abcDEFg")).is(604);
	});

	it("Check Remove Number", function () {

		test.string(mempass.removeNumberPass("567abc567")).is("nnnabcnnn");
	});

	it("Check Capital Letter Pass", function () {

		test.string(mempass.capitalLetterPass("abcDEFg")).is("ABCDEFg");
	});

	it("Check Capital Letter Pass 2", function () {

		test.string(mempass.capitalLetterPass("12345")).is("12345A");
	});

	it("Check Special Char Pass", function () {

		test.string(mempass.specialCharPass("mempass-mempass-mempass")).is("@$m(~&s{mempass{mempass");
	});

	it("Check Parse Seed String", function () {

		var seedOut = mempass.parseSeedForOptions(reseed);

		test.string(seedOut).is(seed);
	});


});