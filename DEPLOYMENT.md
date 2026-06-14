# Quick Deployment Guide for AnimeStream

## 📋 Checklist Before Deployment

- [ ] All files present in repository:
  - ✅ index.html (optimized)
  - ✅ vercel.json
  - ✅ _headers
  - ✅ wrangler.toml
  - ✅ README.md
  - ✅ OPTIMIZATION_REPORT.md
  - ✅ .gitignore

## 🚀 Deploy to Vercel (Recommended)

### Step 1: Connect GitHub to Vercel
```bash
# 1. Go to https://vercel.com
# 2. Sign in with GitHub
# 3. Import repository (https://github.com/Youokbro/anime)
# 4. Click Deploy
# 5. Done! Auto-deploys on git push
```

### Step 2: Verify Deployment
```bash
# Check deployment status at:
# https://your-project.vercel.app
```

## ☁️ Deploy to Cloudflare Pages

### Step 1: Connect GitHub to Cloudflare
```bash
# 1. Go to https://pages.cloudflare.com
# 2. Sign in with Cloudflare account
# 3. Connect GitHub
# 4. Select repository: Youokbro/anime
# 5. Set Build Command: "echo 'Static site'"
# 6. Set Publish Directory: "."
# 7. Deploy
```

### Step 2: Configure Domain (Optional)
```bash
# In Cloudflare Pages > Custom Domain
# Add your domain: anime.example.com
```

## 🌍 Setup Custom Domain

### For Vercel
```bash
# 1. In Vercel Dashboard > Settings > Domains
# 2. Add your domain
# 3. Update DNS records to point to Vercel
```

### For Cloudflare
```bash
# 1. In Cloudflare Pages > Settings > Domains
# 2. Add your domain
# 3. Use Cloudflare nameservers for DNS
```

## 📦 Local Testing Before Deploy

```bash
# Test with local server
python3 -m http.server 8000

# Visit: http://localhost:8000

# Test responsiveness:
# - Open DevTools (F12)
# - Click Device Toolbar (Ctrl+Shift+M)
# - Select "iPad Mini"
# - Verify layout looks good
```

## ⚡ Performance Testing

```bash
# Use Google Lighthouse
# 1. Open DevTools (F12)
# 2. Click "Lighthouse" tab
# 3. Click "Analyze page load"

# Target scores for iPad Mini:
# - Performance: 80+
# - Accessibility: 90+
# - Best Practices: 90+
# - SEO: 90+
```

## 🔧 Post-Deployment Checks

### 1. Check Caching
```bash
# Open DevTools Network tab
# Reload page
# Check Response Headers for:
# Cache-Control: public, max-age=3600
```

### 2. Test Video Playback
```bash
# 1. Search for any anime (e.g., "Naruto")
# 2. Click on it
# 3. Click on Episode 1
# 4. Verify video plays (HLS.js loads async)
```

### 3. Verify AniList Integration
```bash
# 1. Click "Login" button
# 2. Authorize with AniList
# 3. Verify your list appears
# 4. Test updating status
```

### 4. Test Lazy Loading
```bash
# 1. Open DevTools Network tab
# 2. Filter by "Images"
# 3. Scroll down page
# 4. Verify images load as you scroll
```

## 📊 Monitor Performance

### Vercel Analytics
```bash
# 1. Go to Vercel Dashboard
# 2. Select your project
# 3. Analytics > Web Vitals
# 4. Check Core Web Vitals
```

### Cloudflare Analytics
```bash
# 1. Go to Cloudflare Dashboard
# 2. Select your site
# 3. Analytics > Web Analytics
# 4. Monitor traffic
```

## 🐛 Troubleshooting

### Videos not playing?
```
1. Check HLS.js loaded: DevTools > Network tab
2. Check CORS: Look for CORS errors in Console
3. Try different episode
4. Clear cache and reload
```

### Slow on iPad Mini?
```
1. Check Network tab for slow requests
2. Verify Cloudflare caching is active
3. Check for failed API calls
4. Disable browser extensions
```

### Images not showing?
```
1. Check images load in browser normally
2. Verify lazy loading attribute present
3. Check CORS headers
4. Try in incognito mode
```

## 📝 Environment Variables (If Needed)

Currently no env vars needed, but if adding:

```bash
# .env (for local testing)
ANILIST_CLIENT_ID=43388
MIRURO_API_URL=https://miruro-api-navy.vercel.app
```

## 🔐 Security Checklist

- ✅ No sensitive data in code
- ✅ CORS headers configured
- ✅ X-Frame-Options set to SAMEORIGIN
- ✅ X-Content-Type-Options set to nosniff
- ✅ No API keys exposed

## 📞 Support

For issues:
1. Check console for errors (F12)
2. Review OPTIMIZATION_REPORT.md
3. Check GitHub Issues
4. See README.md troubleshooting section

## Version Control

Keep deployment workflow clean:
```bash
git add .
git commit -m "chore: optimized for iPad Mini deployment"
git push origin main
```

---

**Last Updated**: June 14, 2024
**Optimized For**: iPad Mini 1 (1024x768)
**Status**: Ready for production
