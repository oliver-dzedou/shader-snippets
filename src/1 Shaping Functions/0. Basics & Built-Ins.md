
<h3>Miscellaneous useful built-in functions</h3> 

```
y = mod(x,0.5); // return x modulo of 0.5
y = fract(x); // return only the fraction part of a number
y = ceil(x);  // nearest integer that is greater than or equal to x
y = floor(x); // nearest integer less than or equal to x
y = sign(x);  // extract the sign of x
y = abs(x);   // return the absolute value of x
y = clamp(x,0.0,1.0); // constrain x to lie between 0.0 and 1.0
y = min(0.0,x);   // return the lesser of x and 0.0
y = max(0.0,x);   // return the greater of x and 0.0
```


<h3>Trigonometric built-in functions</h3>

```
y = sin(x)
y = asin(x)
y = cos(x)
y = acos(x)
y = tan(x)
y = atan(x)
```


<h3>Built-in interpolation</h3>

The step() interpolation receives two parameters. 
The first one is the limit or threshold, while the second one is the value we want to check or pass.
Any value under the limit will return 0.0 while everything above the limit will return 1.0.

```
y = step(x, 0.5);
```


The other unique function is known as smoothstep()
Given a range of two numbers and a value, this function will (hermite) interpolate the value between the defined range. 
The two first parameters are for the beginning and end of the transition, while the third is for the value to interpolate.

```
y = smoothstep(0.0, 0.5, x);
```
