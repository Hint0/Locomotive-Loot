// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function shuffle(tab, length){
	for(var e = length-1; e > 0; e--){
		var index = round(random(1)*(e-1)),
			temp  = tab[e];
		
		tab[e] = tab[index];
		tab[index] = temp;
	}
}

function make_permutation(){
	show_debug_message("Permutation!");
	randomise();
	var P = array_create(512, 0);
	
	for(var i = 0; i < 256; i++){
		P[i] = i;
	}
	shuffle(P, 256);
	for(var i = 0; i < 256; i++){
		P[i+256] = P[i];
	}
	
	return P;
}

function get_constant_vector(v){
	//v is the value from the permutation table
	var h = v & 3;
	if(h == 0)
		return new vector(1.0, 1.0);
	else if(h == 1)
		return new vector(-1.0, 1.0);
	else if(h == 2)
		return new vector(-1.0, -1.0);
	else
		return new vector(1.0, -1.0);
}

function fade(t){
	return ((6*t - 15)*t + 10)*t*t*t;
}

function Lerp(t, a1, a2){
	return a1 + t*(a2-a1);
}

function noise_2d(_x, _y){
	// Init permutation array once.
	static P = make_permutation();

	var X = floor(_x) & 255;
	var Y = floor(_y) & 255;

	var xf = _x-floor(_x);
	var yf = _y-floor(_y);

	var topRight = new vector(xf-1.0, yf-1.0);
	var topLeft = new vector(xf, yf-1.0);
	var bottomRight = new vector(xf-1.0, yf);
	var bottomLeft = new vector(xf, yf);
	
	//Select a value in the array for each of the 4 corners
	var valueTopRight = P[P[X+1]+Y+1];
	var valueTopLeft = P[P[X]+Y+1];
	var valueBottomRight = P[P[X+1]+Y];
	var valueBottomLeft = P[P[X]+Y];
	
	var dotTopRight = topRight.dot(get_constant_vector(valueTopRight));
	var dotTopLeft = topLeft.dot(get_constant_vector(valueTopLeft));
	var dotBottomRight = bottomRight.dot(get_constant_vector(valueBottomRight));
	var dotBottomLeft = bottomLeft.dot(get_constant_vector(valueBottomLeft));
	
	var u = fade(xf);
	var v = fade(yf);
	
	return Lerp(u,
		Lerp(v, dotBottomLeft, dotTopLeft),
		Lerp(v, dotBottomRight, dotTopRight)
	);
}

function perlin_noise(_x, _y){
	var _noise = 0.0;
	var	_factor = 1.0;
	var	_freq = 0.09;
	var	_noise = _factor*noise_2d(_x*_freq, _y*_freq);
					
	// Add fractal brownian motion
	for(var _frac_it = 0; _frac_it < 7; _frac_it++){
		_factor *= 0.4;
		_freq *= 2.0;
		_noise += _factor*noise_2d(_x*_freq, _y*_freq);
	}
	
	if(_noise > 1){
		_noise = 1;
	}
	
	if(_noise < -1){
		_noise = -1;
	}
	
	return _noise;
}
