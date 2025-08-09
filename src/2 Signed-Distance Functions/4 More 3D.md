
<h3>Elongation</h3>
```
vec4 opElongate( in vec3 p, in vec3 h )
{
    //return vec4( p-clamp(p,-h,h), 0.0 ); // faster, but produces zero in the interior elongated box
    
    vec3 q = abs(p)-h;
    return vec4( max(q,0.0), min(max(q.x,max(q.y,q.z)),0.0) );
}
```

<h3>Rounding</h3>
```
float rounding( in float d, in float h )
{
    return d - h;
}
```

<h3>Onion</h3>

```
float onion( in float d, in float h )
{
    return abs(d)-h;
}

```

<h3>Union, substraction, intersection</h3>
```
float opUnion(float d1, float d2) {
	return min(d1, d2);
}

float opSubstraction(float d1, float d2) {
	return max(-d1, d2);
}

float opIntersection(float d1, float d2) {
	return max(d1, d2);
}

float opXor(float d1, float d2) {
	return max(min(d1, d2)-max(d1,d2));
}
```

<h3>Smooth Union, Substraction, Intersection</h3>
```
float opSmoothUnion(float d1, float d2, float k) {
	float h = clamp(0.5 + 0.5*(d2-d1)/k, 0.0, 1.0);
	return mix(d2, d1, h) -k*h*(1.0-h);
}

float opSmoothSubstraction(float d1, float d2, float k) {
	float h = clamp(0.5 - 0.5*(d2+d1)/k, 0.0, 1.0);
	return mix(d2, -d1, h) + k*h*(1.0-h);
}

float opSmoothIntersection(float d1, float d2, float k) {
	float h = clamp(0.5 - 0.5*(d2-d1)/k, 0.0, 1.0);
	return mix (d2, d1, h) + k*h*(1.0-h);
}
```
