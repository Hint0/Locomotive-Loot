// Script assets have changed for v2.3.0 see

function modulo(a, b){
	gml_pragma("forceinline");
	if(a < 0){
		return b-(-a%b);
	}else{
		return a%b;
	}
}
