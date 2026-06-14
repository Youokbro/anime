# AnimeStream - iPad Mini Optimized Edition

A lightweight anime streaming app optimized for iPad Mini 1 and low-end devices.

## 🌍 LIVE SITE

### **https://youokbro.github.io/anime/**

Visit now! No installation needed, works in Safari 📱

## Features

- Search and browse anime from multiple sources (AniList, MAL, Kitsu)
- Stream episodes from multiple providers with automatic failover
- Subtitle support with automatic English preference
- AniList integration for tracking watch progress
- Dark theme optimized for low-light environments
- Mobile-first responsive design

## Performance Optimizations for iPad Mini

- **Lazy-loaded sections**: MAL and Kitsu sections load after initial render
- **Image lazy loading**: Native `loading="lazy"` attribute for images
- **Async HLS.js**: Video library loads asynchronously
- **API caching**: 1-hour cache for API responses to reduce network calls
- **Memory management**: Periodic cleanup of old cached data
- **Responsive layout**: Optimized grid (2-3 columns) for 1024x768 screens
- **Reduced initial payload**: Only AniList loads on page load

## Deployment

### Vercel
```bash
git push origin main
```
Automatic deployment via Vercel GitHub integration

### Cloudflare Pages
```bash
npm install -g @cloudflare/wrangler
wrangler pages publish .
```

### Manual Deployment
1. Deploy `index.html` to your static hosting
2. Apply headers from `_headers` for optimal caching
3. Configure CORS for API calls if needed

## Development

No build step required! Just edit `index.html` and test in browser.

### Testing Performance

```bash
# Lighthouse audit
lighthouse https://your-domain.com

# WebPageTest
https://webpagetest.org/
```

### Browser Compatibility

- iOS Safari 12+
- Chrome/Edge 60+
- Firefox 54+
- Opera 47+

## Configuration

### API Keys
- AniList Client ID: `43388` (already configured)
- No other API keys required

### Dark Mode
Always enabled. Light mode can be added if needed.

## File Structure

```
anime/
├── index.html          # Main app (all-in-one)
├── vercel.json         # Vercel deployment config
├── wrangler.toml       # Cloudflare config
├── _headers            # Caching headers
└── .gitignore
```

## Performance Metrics (iPad Mini 1)

Target metrics after optimization:
- First Contentful Paint: < 2s
- Largest Contentful Paint: < 4s
- Cumulative Layout Shift: < 0.1
- Total Blocking Time: < 200ms

## Troubleshooting

### Videos not playing
- Check browser supports HLS.js
- Enable CORS if using different domain
- Check console for stream errors

### Slow loading on iPad Mini
- Ensure Cloudflare is caching responses
- Check network tab for failed requests
- Disable browser extensions

## License

MIT

## Credits

- AniList for anime database
- Miruro for streaming provider scraping
- MyAnimeList (MAL) for ratings
- Kitsu for trending anime
