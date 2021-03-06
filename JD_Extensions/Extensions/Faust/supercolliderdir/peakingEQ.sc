FaustPeakingEQ : UGen
{
  *ar { | in1, freq(1000.0), gain(0.0), q(1.0) |
      ^this.multiNew('audio', in1, freq, gain, q)
  }

  *kr { | in1, freq(1000.0), gain(0.0), q(1.0) |
      ^this.multiNew('control', in1, freq, gain, q)
  } 

  checkInputs {
    if (rate == 'audio', {
      1.do({|i|
        if (inputs.at(i).rate != 'audio', {
          ^(" input at index " + i + "(" + inputs.at(i) + 
            ") is not audio rate");
        });
      });
    });
    ^this.checkValidInputs
  }
  
/*
  SynthDef - Typical usage in SuperCollider:

["  in1Bus = Bus.audio(s,1);\n"]
  ~synth = Synth(\faustPeakingEQ, 
	[	in1:in1Bus.asMap,
		freq:freqVar,
		gain:gainVar,
		q:qVar
	]);
 */

  *initClass {
    StartUp.add {
      SynthDesc.mdPlugin = TextArchiveMDPlugin;
// When SynthDef.writeOnce writes metadata:
//    SynthDef.writeOnce(\faustPeakingEQ,
      SynthDef(\faustPeakingEQ,
        { |out=0|
          Out.ar(out, 
            FaustPeakingEQ.ar(
              \in1.ar(0), \freq.kr(1000.0), \gain.kr(0.0), \q.kr(1.0)
            )
          )
        }, metadata: (specs:( 
        //\controlName:[min, max, warp, step, default, units].asSpec,
          \freq:[100.0, 10000.0, 0, 1.0, 1000.0].asSpec,
          \gain:[-10.0, 10.0, 0, 0.1, 0.0].asSpec,
          \q:[0.01, 100.0, 0, 0.01, 1.0].asSpec
  ) ) ).store } }
// When SynthDef.writeOnce writes metadata:
//) ) ) } }

  name { ^"FaustPeakingEQ" }
}

