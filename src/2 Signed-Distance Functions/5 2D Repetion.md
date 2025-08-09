
**Limited repetition**
```
float limited_repeated( vec2 p, vec2 size, float s ) { 
	vec2 id = round(p/s); 
	vec2 o = sign(p-s*id); 
	float d = 1e20; 
	for( int j=0; j<2; j++ ) 
	for( int i=0; i<2; i++ ) { 
		vec2 rid = id + vec2(i,j)*o; // limited repetition 
		rid = clamp(rid,-(size-1.0)*0.5,(size-1.0)*0.5); 
		vec2 r = p - s*rid; 
		d = min( d, sdf(r) ); 
	} 
	return d; 
}
```

**Infinite repetition**

```
float repeated( vec2 p, float s ) { 
	vec2 id = round(p/s); 
	vec2 o = sign(p-s*id); // neighbor offset direction 
	float d = 1e20; 
	for( int j=0; j<2; j++ ) 
	for( int i=0; i<2; i++ ) { 
		vec2 rid = id + vec2(i,j)*o; 
		vec2 r = p - s*rid; 
		d = min( d, sdf(r) ); 
	} 
	return d; 
}
```

