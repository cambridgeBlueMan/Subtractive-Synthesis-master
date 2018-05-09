

// synthdefs
// granular synth

(
SynthDef(\sfgrain, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04;
var grain;
// the important thing is that htis synth is passed a starting position, calculated elsewhere
// it then plays and is released because the envelope in the synth has reached an end
// so in our chuck implementation we nedd to use the SndBuf.pos parameter
// and we also need to define an envelope for the buffer
// and we then need to pan that
grain= PlayBuf.ar(1,bufnum, BufRateScale.kr(bufnum)*1.5, 1, BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(0.01,dur),doneAction:2)-0.001);

Out.ar(0,Pan2.ar(grain, pan,0.2))}).send(s);
)


// filter synth
(
SynthDef("noise",
	{ arg out = 0, freq1, freq2, freq3, transTime1 = 3, sustTime = 3, transTime2 = 3;
   // transition times and sustain time remain constant and give a total
   // envelope length of 9 seconds
   var signal, env;
	signal = { Mix(
					 	BPF.ar(
					 	// brown noise is signal into the BPF
					  	BrownNoise.ar,
					  	// next line is cut off freq, so this presumable creates
					  	// 3 instances of the filtered signal
					  	[ freq1, freq2, freq3 ],
					  	// reciprocal of Q, bandwidth/cutoff freq
					  	// originally 0.5, which is fairly clean
					  	// at 1.5 there is a bit of noise
					  	// at 10.5 it is far too course
					  	0.5/[ freq1, freq2, freq3 ],
					  	// a mul
					  	4)
					)
					// I think ! is make 2 instances of
				  	}!2;
	env	  = EnvGen.kr(
					Env(	[ 0, 1, 1, 0 ],
						 	[transTime1, sustTime,
					 		 transTime2],
					 		\sine),
					1,
					doneAction:2);
Out.ar(out, (signal * env), -1)
  }).store

)
// load buffer

b = Buffer.read(s,Document.current.dir ++ "/sounds/testgrain7.aif");


// run program
(

//var lastval=0.6;

r = Routine({
			loop({
					 s.sendMsg(\s_new, \noise, -1, 0, 1,
									 \freq1, exprand(100.0, 1000.0),
									 \freq2, exprand(100.0, 1000.0),
									 \freq3, exprand(100.0, 1000.0)
									);
					 (3 + 3).wait
			})
		});


SystemClock.play(r)
 )
(
// here we have an infinite loop


{
inf.do{arg i;
	var prop, timestart, timeend, lastval=0.6; //.6;
	// prop holds values between 1/300 (0 really, but ...) and 1
	prop= (i%300)/300;
	timestart= prop*0.8; // will have values in the range 1/300 + .8 to 1.8
	timeend= prop*(0.8+(0.1*lastval)); // will have values in the range
	// min (.8 + .06)/300 = 3 milli secs approx.
	// max
	Synth(\sfgrain,[\bufnum, b.bufnum, \startPos,rrand(timestart,timeend),\amp, 0.005, // exprand(0.005,0.1),
	\pan, lastval.rand2, \dur, 0.1+(lastval*0.5)]);
	(((lastval*0.2)+0.01).max(0.01)).wait
};
}.fork;

 )
a=Pfunc({exprand(100.0, 1000.0)});
//b=Pseq([a],6);

Pbind(\instrument, \noise,
		\dur, 6,
		\freq1, a,
		\freq2, a,
		\freq3, a
	).play





Pbind(\instrument, \noise,
		\dur, 6,
		\freq1, Pseq([100,200,300]),
		\freq2, Pseq([200,400,600]),
		\freq3, Pseq([300,600,900])
	).play

