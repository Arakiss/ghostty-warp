// cyber-crt.glsl — Cyberpunk 2077-style CRT pass for cmux/ghostty (v2, 2026-07-06)
// Edge-gated chromatic aberration + fine scanlines + neon bloom + vignette.
// Fully STATIC (no iTime): safe with custom-shader-animation = false.
//
// v2 retune after field test on 3440x1440: v1's aberration reached ~10px at the
// corners (UV-unit math error) and smeared text. Now the offset is expressed in
// PIXELS (max ~1.2px), and a smoothstep gate keeps the central ~60% of the
// screen — where the work happens — at exactly zero aberration.

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 c = uv - 0.5;
    float r2 = dot(c, c);            // 0 center → 0.5 corner

    // Chromatic aberration: zero inside the central area, up to ~1.2px at the
    // very corners, expressed in pixel units so resolution cannot surprise us.
    float edge = smoothstep(0.12, 0.5, r2);          // 0 until ~half-way out
    vec2 dir = r2 > 0.0 ? normalize(c) : vec2(0.0);
    vec2 off = dir * edge * 1.2 / iResolution.xy;    // ≤1.2px, radial
    vec4 base = texture(iChannel0, uv);
    float cr = texture(iChannel0, uv + off).r;
    float cb = texture(iChannel0, uv - off).b;
    vec3 col = vec3(cr, base.g, cb);

    // Neon bloom: 4-tap cross, luminance-gated so only highlights halo
    vec2 px = 1.0 / iResolution.xy;
    const float R = 1.6;
    vec3 nb = vec3(0.0);
    nb += texture(iChannel0, uv + vec2( R, 0.0) * px).rgb;
    nb += texture(iChannel0, uv + vec2(-R, 0.0) * px).rgb;
    nb += texture(iChannel0, uv + vec2(0.0,  R) * px).rgb;
    nb += texture(iChannel0, uv + vec2(0.0, -R) * px).rgb;
    nb *= 0.25;
    float lum = dot(nb, vec3(0.2126, 0.7152, 0.0722));
    col += nb * smoothstep(0.35, 0.9, lum) * 0.18;

    // Fine scanlines: 2px period, 2% depth — texture, not costume
    float scan = 0.98 + 0.02 * sin(fragCoord.y * 1.5708);
    col *= scan;

    // Vignette, up to ~4% at the corners
    vec2 v = uv * (1.0 - uv);
    float vig = pow(v.x * v.y * 15.0, 0.10);
    col *= mix(0.96, 1.0, clamp(vig, 0.0, 1.0));

    fragColor = vec4(col, base.a);
}
