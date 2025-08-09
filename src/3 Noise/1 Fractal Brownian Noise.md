```
float fbm (vec2 uv, float gain) {
    // Initial values
    float value = 0.0;
	float amplitude = 1.;
    float frequency = 0.;
    //
    // Loop of octaves
    for (int i = 0; i < 6; i++) {
        value += amplitude * noise(uv);
        uv *= 2.;
        amplitude *= gain;
    }
    return value;
}
```