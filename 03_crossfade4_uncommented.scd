

// 56 lines of code
(
SynthDef(\sfgrain, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04;
var grain;
grain= PlayBuf.ar(1,bufnum, BufRateScale.kr(bufnum)*1.5, 1, BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(0.01,dur),doneAction:2)-0.001);
Out.ar(0,Pan2.ar(grain, pan,0.225))}).send(s);
)

(
SynthDef("noise",
	{ arg out = 0, freq1, freq2, freq3, transTime1 = 3, sustTime = 3, transTime2 = 3;
   var signal, env;
	signal = { Mix(
					 	BPF.ar(
					  	BrownNoise.ar,
					   	[ freq1, freq2, freq3 ],
					   	0.5/[ freq1, freq2, freq3 ],
					  	4)
					)
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

SystemClock.play(r);


{
inf.do{arg i;
	var prop, timestart, timeend, lastval=0.6;
	prop= (i%300)/300;
	timestart= prop*0.8;
	timeend= prop*(0.8+(0.1*lastval));
	Synth(\sfgrain,[\bufnum, b.bufnum, \startPos,rrand(timestart,timeend),\amp, 0.005,
	\pan, lastval.rand2, \dur, 0.1+(lastval*0.5)]);
	(((lastval*0.2)+0.01).max(0.01)).wait
};
}.fork;

 )
