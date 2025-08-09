#version 330 core

#define WARP 0.7
#define SCAN 0.4
#define BRIGHTNESS_COMPENSATION 1.3

out vec4 fragColor;

uniform vec2 resolution;
uniform sampler2D texture0;
uniform sampler2D scene;

vec2 get_uv(vec2 pos) {
    return pos / resolution;
}

vec2 get_uv_normal(vec2 pos) {
    return (pos / resolution) * 2.0 - 1.0;
}

void main() {
    vec2 uv = get_uv(gl_FragCoord.xy);
    vec2 dc = abs(0.5 - uv);
    dc *= dc;

    float apply = abs(sin(gl_FragCoord.y) * SCAN);

    fragColor = vec4(mix(texture(scene, uv).rgb, vec3(0.0), apply), 1.0) * BRIGHTNESS_COMPENSATION;
}
