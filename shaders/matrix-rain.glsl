// matrix-rain.glsl — digital rain behind the terminal for cmux/ghostty (2026-07-06)
// Classic green code-fall that lives ONLY in dark regions: a luminance gate
// fades the rain wherever there is text, so content stays readable.
// Time-driven: requires custom-shader-animation = true (continuous redraws
// while focused — use as an occasional vibe, not the daily default).

float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 base = texture(iChannel0, uv);

    // Glyph grid: 14px columns, 22px rows
    float col = floor(fragCoord.x / 14.0);
    float rowh = 22.0;
    float rows = iResolution.y / rowh;
    float row = floor((iResolution.y - fragCoord.y) / rowh);   // falls downward

    // Per-column speed and phase
    float speed = 0.35 + 0.65 * hash(vec2(col, 7.0));
    float head = iTime * speed * rows * 0.22 + hash(vec2(col, 13.0)) * rows;
    float d = mod(row - head, rows);                            // distance behind head

    // Trail decay + per-cell flicker that fakes changing glyphs
    float trail = exp(-d * 0.20);
    float g = 0.35 + 0.65 * step(0.5, hash(vec2(col, row + floor(head * 0.5 + d))));
    vec3 rain = vec3(0.05, 1.0, 0.45) * trail * g;
    rain += vec3(0.75, 1.0, 0.85) * exp(-d * d * 2.0) * 0.9;   // bright head

    // Readability gate: rain only where the terminal is dark
    float lum = dot(base.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 out_col = base.rgb + rain * (1.0 - smoothstep(0.08, 0.35, lum)) * 0.45;

    fragColor = vec4(out_col, base.a);
}
