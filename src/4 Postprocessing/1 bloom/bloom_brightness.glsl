#version 330 core

#define THRESHOLD 0.2
#define LUMINANCE_RGB vec3(0.21, 0.72, 0.07)

out vec4 fragColor;

uniform vec2 resolution;
uniform sampler2D texture0;
uniform sampler2D raw_scene;

vec2 get_uv(vec2 pos) {
    return pos / resolution;
}

vec2 get_uv_normal(vec2 pos) {
    return (pos / resolution) * 2.0 - 1.0;
}

float get_aspect() {
    return max(resolution.x, resolution.y) / min(resolution.x, resolution.y);
}

void main() {
    vec2 uv = get_uv(gl_FragCoord.xy);
    vec3 color = texture(raw_scene, uv).rgb;
    float luminance = dot(color.rgb, LUMINANCE_RGB);
    float weight = max(luminance - THRESHOLD, 0.0) / THRESHOLD;
    fragColor = vec4(color * weight, 1.0);
}
