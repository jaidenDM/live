SynthDef(\dreamverb, {|out = 0, fadeTime=1|
	var mix = \mix.kr(0.2);
    var dry = \in.ar(0!2);
    var wet = JPverb.ar(
        dry,
        \t60.kr(1,           0.05),
        \damp.kr(0,          0.05),
		\size.kr(1, 		 0.05),
        \earlydiff.kr(0.707, 0.05),
        \mdepth.kr(5,        0.05),
        \mfreq.kr(2,         0.05),
        \lowx.kr(1,          0.05),
        \midx.kr(1,          0.05),
        \highx.kr(1,         0.05),
        \lowband.kr(500,     0.05),
        \highband.kr(2000,   0.05)
    );
 		XOut.ar(out,fadeTime,((dry * (1-mix)) + (wet * mix)) * \amp.kr(0.33));
	}, variants:(
		\dream : [
			'amp' :  0.66015625,
			'mix' :  0.5,
			't60' :  4,
			'damp' :  0.31443298969072,
			'size' :  2,
			'mfreq' :  0.10309278350515,
			'mdepth' :  4.639175257732,
			'lowx' :  0.84375,
			'midx' :  0.70618556701031,
			'highx' :  0.0,
			'lowband' :  2450.0822520097,
			'highband' :  1024.0219794048,
			'fadeTime' :  1,
			'earlydiff' :  1
		]
	)
).add;	
//-----------------------------------------------------------------------
//-----------------------------------------------------------------------
// NDEF VARIANTS
// Ndef('dreamverb').variant_(
// 	\dream,
// 	'amp', 0.66015625,
// 	'mix', 0.5,
// 	't60', 4,
// 	'damp', 0.31443298969072,
// 	'size', 2,
// 	'mfreq', 0.10309278350515,
// 	'mdepth', 4.639175257732,
// 	'lowx', 0.84375,
// 	'midx', 0.70618556701031,
// 	'highx', 0.0,
// 	'lowband', 2450.0822520097,
// 	'highband', 1024.0219794048,
// 	'fadeTime', 1,
// 	'earlydiff', 1
// );
//-----------------------------------------------------------------------
//-----------------------------------------------------------------------
//NK CONFIG
NKConf(\dreamverb, {
	n[\knob0].cc_({|val| Ndef(\dreamverb).smap('mix', val )});
	n[\knob1].cc_({|val| Ndef(\dreamverb).smap('amp', val)});
	n[\knob2].cc_({|val| Ndef(\dreamverb).smap('t60', val)});
	n[\knob3].cc_({|val| Ndef(\dreamverb).smap('damp', val)});
	n[\knob4].cc_({|val| Ndef(\dreamverb).smap('size', val)});
	n[\knob5].cc_({|val| Ndef(\dreamverb).smap('earlydiff', val)});

	n[\fader0].cc_({|val| Ndef(\dreamverb).smap('mdepth', val)});
	n[\fader1].cc_({|val| Ndef(\dreamverb).smap('mfreq', val)});
	n[\fader2].cc_({|val| Ndef(\dreamverb).smap('lowx', val)});
	n[\fader3].cc_({|val| Ndef(\dreamverb).smap('midx', val)});
	n[\fader4].cc_({|val| Ndef(\dreamverb).smap('highx', val)});
	n[\fader5].cc_({|val| Ndef(\dreamverb).smap('lowband', val)});
	n[\fader6].cc_({|val| Ndef(\dreamverb).smap('highband', val)});
});
//-----------------------------------------------------------------------
//-----------------------------------------------------------------------
Ndef(\dreamverb);

