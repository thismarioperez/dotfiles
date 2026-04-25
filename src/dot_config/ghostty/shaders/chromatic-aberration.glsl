#define OFFSET 0.0004

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;

    float r = texture(iChannel0, uv + vec2(OFFSET, 0.0)).r;
    float g = texture(iChannel0, uv).g;
    float b = texture(iChannel0, uv - vec2(OFFSET, 0.0)).b;
    float a = texture(iChannel0, uv).a;

    fragColor = vec4(r, g, b, a);
}
