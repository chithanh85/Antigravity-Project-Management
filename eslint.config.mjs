import security from "eslint-plugin-security";

export default [
    security.configs.recommended,
    {
        ignores: [
            "**/node_modules/**",
            "**/.agent/**",
            "**/.antigravity/**",
            "**/dist/**",
            "**/build/**"
        ]
    }
];
