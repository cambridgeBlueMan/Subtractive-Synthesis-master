// pattern as it was, but can now accept input from phone
	patternArray[0] = Pbind(
		\instrument, "noise-quneo-2",
		\freq, myProxies[0]["freq"],
		\pulseFreq, myProxies[0]["pulseFreq"],
		\dur, 0.3,
		\amp, myProxies[0]["amp"],
		\rq,  myProxies[0]["rq"]);

	// ***********************************************************************************************

	patternArray[1] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Pseq([0,3,5,7,9,11,14,17], inf),
		\pulseFreq, Pwhite(1, 9),
		\dur, 0.3,
		\amp, 1,
		\rq, 0.01);

	patternArray[2] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Prand([0,3,5,7,9,11,14,17], inf) - 12,
		\pulseFreq, Pwhite(1, 9),
		\dur, 0.3,
		\sustain, 0.1,
		\amp, 1,
		\rq, 0.1);

	patternArray[3] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Pxrand([0,3,5,7,9,11,14,17], inf) + 12,
		\pulseFreq, Pwhite(1, 9),
		\dur, Pseq([0.2, 0.3, 0.2, 0.4], inf) * Pwhite(2, 4),
		\sustain, 0.6,
		\amp, Pwhite(0.3, 0.6),
		\rq, Prand([0.05, 0.1], inf));

	patternArray[4] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.phrygian,
		\degree, Pseq([0,3,5,7,9,11,14,17], inf),
		\pulseFreq, Pwhite(5, 19),
		\dur, 0.3,
		\amp, 1,
		\rq, Pwhite(0.005, 0.01));

	patternArray[5] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.phrygian,
		\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
		\pulseFreq, Pwhite(5, 19),
		\dur, 0.33,
		\amp, 1,
		\rq, Pwhite(0.005, 0.01));

	patternArray[6] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.phrygian,
		\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
		\pulseFreq, 0.5,
		\dur, Pseq( (0.1!60) ++ (0.2!8)   , inf),
		\amp, 1,
		\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));

	patternArray[7] = Pbind(
		\instrument, "noise-quneo-2",
		\freq, Pwhite(1000, 9500),
		\pulseFreq, Pwhite(5, 10),
		\dur, 0.3,
		\amp, Pwhite(0.1, 0.5),
		\rq, Pwhite(0.001, 0.05));

	patternArray[8] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Pshuf([4,3,5,7,9,11,14,17], inf),
		\pulseFreq, Pwhite(1, 9),
		\dur, 0.3,
		\amp, 1,
		\rq, 0.01);

	patternArray[9] = Pbind(
		\instrument, "noise-quneo-2",
		\note, Prand([0,3,5,7,9,11,14,17], inf),
		\pulseFreq, Pwhite(1, 9),
		\dur, 0.3,
		\sustain, 0.1,
		\amp, 1,
		\rq, 0.1);

	patternArray[10] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Pxrand([0,3,5,7,9,11,14,17], inf) - 12,
		\pulseFreq, Pwhite(1, 9),
		\dur, Pseq([0.2, 0.1, 0.2, 0.4], inf) * Pwhite(1, 4),
		\sustain, 0.2,
		\amp, Pwhite(0.3, 0.6),
		\rq, Prand([0.05, 0.1], inf));

	patternArray[11] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.phrygian,
		\degree, Pseq([0,5,9,3,7,11], inf),
		\pulseFreq, Pwhite(5, 19),
		\dur, 0.3,
		\amp, 1,
		\rq, Pwhite(0.005, 0.01));

	patternArray[12] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.phrygian,
		\degree, Pseq([0,3,5,7,9,11,14,17], inf) + Pwrand([0, 12], [0.5, 0.5], inf),
		\pulseFreq, Pwhite(1, 19),
		\dur, 0.43,
		\amp, 1,
		\rq, Pwhite(0.005, 0.01));

	patternArray[13] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.locrian,
		\degree, Pseq([7,8,6,5,4,3,2,1,0,4], inf) + Pwrand([0, 1], [0.9, 0.1], inf),
		\pulseFreq, 0.5,
		\dur, Pseq( (0.1!10) ++ (0.2!8)   , inf),
		\amp, 0.6,
		\rq, Pwrand([0.005, 0.01], [0.95, 0.05], inf));

	patternArray[14] = Pbind(
		\instrument, "noise-quneo-2",
		\degree, Pxrand([1,3,4,7], inf) + 24,
		\pulseFreq, Pwhite(1, 9),
		\dur, Pseq([0.2, 0.3, 0.1, 0.4], inf) * Pwhite(2, 4),
		\sustain, 0.6,
		\amp, Pwhite(0.3, 0.6),
		\rq, Prand([0.05, 0.1], inf));

	patternArray[15] = Pbind(
		\instrument, "noise-quneo-2",
		\scale, Scale.mixolydian,
		\degree, Pseq([0,7,5,3,9,11,0], inf) + 12,
		\pulseFreq, Pwhite(5, 19),
		\dur, 0.5,
		\amp, 0.5,
		\rq, Pwhite(0.05, 0.09));





(
// ****************************************************************
// create a set if osc funcs to handle a 4 X 4 toggle button array
var toggleFuncsList = List.new(0);
4.do({|r|
	4.do({|c|

		toggleFuncsList.add(OSCFunc.new({|msg|
			msg.postln;
		}; // end osc func function
		,
		("/blatma/" ++ (r + 1).asString ++ "/" ++ (c + 1).asString;).postln;
		); // end osc func
		) // end add
	}) // end c do
} )// end r do
)

// **********************************************************
// a pBind copied from the Sub Synth gui demo file as a modle
Pbind(
	\instrument, "noise",
	\freq, Pwhite(100, 5500),
	\pulseFreq, Pwhite(5, 10),
	\dur, 0.3,
	\amp, Pwhite(0.1, 0.5),
	\rq, Pwhite(0.001, 0.05)).play;
)

// ***************************************
// a hacked synth def now with changed env
(
SynthDef("noise", {arg freq = 1000, pulseFreq = 10, amp = 0.1, rq = 0.001,
	att = 3, dec = 3, sus = 3, gate = 1;
	var snd, env;
	//env = EnvGen.kr(Env.adsr(att, dec, sus, rel), gate: gate, doneAction: 2);
	env	  = EnvGen.kr(
		Env(	[ 0, 1, 1, 0 ],
			[att, sus,
				dec],
			\sine),
		1,
		doneAction:2);
	snd = BPF.ar(
		in: WhiteNoise.ar(LFPulse.ar(pulseFreq,0,0.5) // * 0.1
		),
		freq: freq,
		rq: Lag.kr(rq, 1));
	snd = snd * env * Lag.kr(amp, 1) * 100;
	snd = Clip.ar(snd, -0.5, 0.5);
	Out.ar(0, [snd, snd]);
}).add;

/*SynthDef(\amp, {arg inbus=0, amp = 0.1;
ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
}).add;*/
)
x = Synth("noise")
// ************************************
// a synth based on the above synth def
x = Synth(\noise, [\freq, 400, \pulseFreq, 2, \amp, 0.5])

// release it
// x.release
// also release it
// x.set(\gate, 0);

Server
(

var freq=0.3, pulseFreq, rq;
var oscMsg = List.new(0);
// ************************************
// now let's get some info from a phone
4.do({|i|
	oscMsg.add(
	OSCFunc({|msg|
		msg.postln;
		freq = msg[1].postln;
	},
	"/2/fader" ++ i.asString
	)
	)
});
// *************************
// now lets loop such asynth


r = Routine({
	loop({
		x = Synth(\noise,
			[
				\freq, ControlSpec(100,5500, \exp).map(freq).postln,
				\pulseFreq, 2,
				\amp, 0.5

		]);

		3.wait
	})
});


SystemClock.play(r)
)

OSCFunc.trace


ControlSpec(100,5500, \exp).map(freq)


(
var twat = Dictionary.new(8);
twat["monkey"] = "I am a monkey";
twat.postln;
)