#define OFFSET 0.0003

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 shift = vec2(OFFSET, 0.0);

    vec4 center = texture(iChannel0, uv);
    float r = texture(iChannel0, uv + shift).r;
    float b = texture(iChannel0, uv - shift).b;

    fragColor = vec4(r, center.g, b, center.a);
}
