function Clock(selector) {
	var _this = this;

	// Elements
	var svg = d3.select(selector),
		borderCircle,
		marksG,
		handsG,
		secondsHandG,
		hoursHand,
		minutesHand,
		secondsHand;

	// Settings
	var setters = {},
		S = {};

	addSetting( "size",              "int",    200       );
	addSetting( "clockSkew",         "int",    0         );
	addSetting( "backgroundColor",   "str",    "#f8f8f8" );
	addSetting( "borderColor",       "str",    "#222"    );
	addSetting( "markColor",         "str",    "#222"    );
	addSetting( "handColor",         "str",    "#222"    );
	addSetting( "secondsHandColor",  "str",    "#c00"    );

	function addSetting(name, type, def) {
		setters[name] = function (v) {
			if (type == "str") {
				v = "" + v;
			} else if (type == "int") {
				v = v|0;
			}
			S[name] = v;
		};

		_this[name] = function (v) {
			if (arguments.length == 0) {
				return S[name];
			} else {
				setters[name](v);
				redraw();
				return _this;
			}
		};

		S[name] = def;
	}

	_this.settings = function (s) {
		var k, r = {};
		if (arguments.length == 0) {
			for (k in setters) {
				r[k] = S[k];
			}
			return r;
		} else {
			for (k in s) {
				if (typeof setters[k] != "undefined") {
					setters[k](s[k]);
				}
			}
			redraw();
			return _this;
		}
	};

	// Initialization
	var ticker = setInterval(tick, 200),
		hms = now();

	_this.stop = function () {
		clearInterval(ticker);
	};

	createElements();
	redraw();
	updateHands();

	function createElements() {
		var i;

		svg.attr("viewBox", "0 0 200 200");

		borderCircle = svg.append("circle")
			.attr("cx", 100)
			.attr("cy", 100)
			.attr("r", 98);

		marksG = svg.append("g");
		for (i = 1; i <= 12; i++) {
			marksG.append("rect")
				.attr("x", 98)
				.attr("y", 7)
				.attr("width", 4)
				.attr("height", 10)
				.attr("transform", "rotate(" + (30*i) + " 100 100)");
		}

		handsG = svg.append("g");

		hoursHand = handsG.append("rect")
			.attr("x", 98)
			.attr("y", 55)
			.attr("width", 4)
			.attr("height", 57);

		minutesHand = handsG.append("rect")
			.attr("x", 98)
			.attr("y", 20)
			.attr("width", 4)
			.attr("height", 92);

		handsG.append("circle")
			.attr("cx", 100)
			.attr("cy", 100)
			.attr("r", 6);

		secondsHandG = svg.append("g");

		secondsHand = secondsHandG.append("path")
			.attr("d", "M 99,12 H 101 V 113 H 102 V 135 H 98 V 113 H 99 Z");

		secondsHandG.append("circle")
			.attr("cx", 100)
			.attr("cy", 100)
			.attr("r", 3);
	}

	function redraw() {
		svg
			.attr("width", S.size)
			.attr("height", S.size);

		borderCircle
			.attr("fill", S.backgroundColor)
			.attr("stroke", S.borderColor)
			.attr("stroke-width", 4);

		marksG
			.attr("fill", S.markColor);

		handsG
			.attr("fill", S.handColor);

		secondsHandG
			.attr("fill", S.secondsHandColor);
	}

	function updateHands() {
		var hd = 360 / (12*60) * (60*hms[0] + hms[1]),
			md = 360 / (60*60) * (60*hms[1] + hms[2]),
			sd = 360 / 60 * hms[2];

		hoursHand.attr("transform", "rotate(" + hd + " 100 100)");
		minutesHand.attr("transform", "rotate(" + md + " 100 100)");
		secondsHand.attr("transform", "rotate(" + sd + " 100 100)");
	}

	function tick() {
		var n = now();

		if (n[0] != hms[0] || n[1] != hms[1] || n[2] != hms[2]) {
			hms = n;
			updateHands();
		}
	}

	function now() {
		var d = new Date(+(new Date) + S.clockSkew);
		return [d.getHours(), d.getMinutes(), d.getSeconds()];
	}
}
