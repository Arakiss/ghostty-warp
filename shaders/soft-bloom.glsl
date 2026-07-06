// soft-bloom.glsl — subtle phosphor bloom + gentle vignette for cmux/ghostty
// (2026-07-06). Design goals: tasteful, invisible until bright text appears,
// and CHEAP — 8 texture taps, no loops, no time-based animation, so it only
// costs one light pass when the terminal actually redraws.
//
// Shadertoy-compatible entry point: iChannel0 is the rendered terminal.

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 base = texture(iChannel0, uv);

    // 8-tap cross+diagonal neighborhood, ~1.6px radius
    vec2 px = 1.0 / iResolution.xy;
    const float R = 1.6;
    vec3 nb = vec3(0.0);
    nb += texture(iChannel0, uv + vec2( R, 0.0) * px).rgb;
    nb += texture(iChannel0, uv + vec2(-R, 0.0) * px).rgb;
    nb += texture(iChannel0, uv + vec2(0.0,  R) * px).rgb;
    nb += texture(iChannel0, uv + vec2(0.0, -R) * px).rgb;
    nb += texture(iChannel0, uv + vec2( R,  R) * px).rgb * 0.7;
    nb += texture(iChannel0, uv + vec2(-R,  R) * px).rgb * 0.7;
    nb += texture(iChannel0, uv + vec2( R, -R) * px).rgb * 0.7;
    nb += texture(iChannel0, uv + vec2(-R, -R) * px).rgb * 0.7;
    nb /= 6.8;

    // Luminance gate: only genuinely bright pixels bleed, so body text stays
    // crisp and only highlights (bold, accents, spinners) get the halo.
    float lum = dot(nb, vec3(0.2126, 0.7152, 0.0722));
    vec3 bloom = nb * smoothstep(0.35, 0.9, lum) * 0.22;

    vec3 col = base.rgb + bloom;

    // Gentle vignette: max ~2.5% darkening at the corners — depth, not shade.
    vec2 v = uv * (1.0 - uv);
    float vig = pow(v.x * v.y * 15.0, 0.08);
    col *= mix(0.975, 1.0, clamp(vig, 0.0, 1.0));

    fragColor = vec4(col, base.a);
}
