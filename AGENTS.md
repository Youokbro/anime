# Deployment

- Frontend: `git push origin main` → auto-deploys to `youokbro.github.io/anime/`
- Backend: `git push origin main` → auto-deploys to `anime-api-nu-eight.vercel.app`

# Provider Blocks (Frontend)

- **Miruro-API** — 8 providers: bonk, ally, bee, kiwi, moo, pewe, hop, ANIMEDUNYA (SUB + DUB)
- **Consumet-All** — 6 providers: Hianime, AnimePahe, AnimeSaturn, AnimeUnity, AnimeKai, KickAssAnime
- **HDHub Direct** — R2 + PixelDrain MKV links
- **HDHub CF Worker** — fresh-token stream via anim-proxy-worker
- **AnimeVerse** — direct MP4 CDN via animeverse-worker (self-hosted, no expiring tokens)
- **AniZone** — HLS streams
- **yaStream** — kisskh provider via yastream.tamthai.de (Asian dramas/anime fallback)
- **StreamViX** — Italian HLS sources

# Cloudflare Workers

- `anim-proxy-worker` — Miruro pipe + stream proxy (JWE ECDH-ES). `anim-proxy-worker.ahaantadi.workers.dev`
- `allanime-worker` — AllAnime GraphQL search/info (streams blocked by CAPTCHA). `allanime-worker.ahaantadi.workers.dev`
- `animeverse-worker` — AnimeVerse HMAC-signed stream scraper (replaces public AnilistStream). `animeverse-worker.ahaantadi.workers.dev`
  - `/catalog/anime/as-search/search=QUERY.json` — search (proxied from public AnilistStream)
  - `/stream/anime/as:SLUG:ANIID:MALID:EP.json` — stream (direct HMAC auth, no cf_clearance needed)

Deploy: `bash deploy-workers.sh`
