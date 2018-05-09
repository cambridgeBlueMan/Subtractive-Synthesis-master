
////crossfade
(
SynthDef("mySynth",
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
					  	0.5/[ freq1, freq2, freq3 ],
					  	// a mul
					  	2)
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
  }).load(s)

)

Pan2

(
r = Routine({
			loop({
					 s.sendMsg(\s_new, \mySynth, -1, 0, 1,
									 \freq1, exprand(100.0, 1000.0),
									 \freq2, exprand(100.0, 1000.0),
									 \freq3, exprand(100.0, 1000.0)
									);
					 (3 + 3).wait
			})
		});


SystemClock.play(r)

)


