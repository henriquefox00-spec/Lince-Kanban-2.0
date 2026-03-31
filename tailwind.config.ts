import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        brand: '#EE3363',
        'brand-dark': '#C4254F',
        'bg-dark': '#0A0A0A',
        'bg-card': '#111111',
        'bg-hover': '#1A1A1A',
        'bg-border': '#1E1E1E',
      },
      fontFamily: {
        sans: ['var(--font-jakarta)', 'system-ui', 'sans-serif'],
        display: ['var(--font-syne)', 'system-ui', 'sans-serif'],
      },
      boxShadow: {
        'brand': '0 0 20px rgba(238, 51, 99, 0.3)',
        'brand-sm': '0 0 10px rgba(238, 51, 99, 0.2)',
        'card': '0 4px 24px rgba(0, 0, 0, 0.4)',
      },
      animation: {
        'fade-in': 'fadeIn 0.3s ease-out',
        'slide-up': 'slideUp 0.4s ease-out',
        'pulse-brand': 'pulseBrand 2s ease-in-out infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { opacity: '0', transform: 'translateY(16px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        pulseBrand: {
          '0%, 100%': { boxShadow: '0 0 0 0 rgba(238, 51, 99, 0)' },
          '50%': { boxShadow: '0 0 20px 4px rgba(238, 51, 99, 0.3)' },
        },
      },
    },
  },
  plugins: [],
};

export default config;
