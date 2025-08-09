#define OFFSET vec2(0.0, 0.0)
#define SMOOTHING_AMOUNT 1.0
#define RADIUS 0.5
#define COLOR vec3(1.0, 0.0, 0.0)

// Implementation of the AA technique from
// https://blog.frost.kiwi/analytical-anti-aliasing
// I am not the author of that article!

float sdfCircle(vec2 uv, vec2 offset, float radius) {
    float dist = length(uv - OFFSET);
    return radius - dist;
}

float smoothed(float dist, float pixel_size) {
    return dist / (pixel_size * SMOOTHING_AMOUNT);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = (fragCoord / iResolution.xy) * 2.0 - 1.0;
    float aspect = iResolution.x / iResolution.y;
    uv.x *= aspect;

    float dist = sdfCircle(uv, OFFSET, RADIUS);
    float pixel_size = fwidth(dist);
    float alpha = smoothed(dist, pixel_size);

    fragColor = vec4(COLOR * alpha, 1.0);
}
