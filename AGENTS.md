# Deployment

- Frontend: `git push origin main` → auto-deploys to `youokbro.github.io/anime/`
- Backend: `git push origin main` → auto-deploys to `anime-api-nu-eight.vercel.app`

# Source Providers

## Working
- **Miruro-API** (bonk, ally, bee, kiwi, moo, pewe, hop, ANIMEDUNYA) — all via `/stream/miruro` on Vercel backend (proxied for CORS). Each provider returns sub+dub episodes. Also adds MF-proxied versions.
- **Consumet-All** (`/stream/consumet-all`) — tries all 6 Consumet providers (AnimeSaturn, AnimeUnity, Hianime, AnimePahe, AnimeKai, KickAssAnime) in parallel via Vercel backend
- **HDHub** (`/stream/hdhub`) — returns R2 signed URLs (stable) + PixelDrain URLs + CF Worker proxy versions. R2 and PixelDrain work directly. CF Worker proxy handles expired tokens.
  - CF Worker proxy: `anim-proxy-worker.ahaantadi.workers.dev/proxy?url=...`
- **AniZone/HiAnime/Gogoanime** — Miruro-API scrapers via `/stream/miruro`
- **StreamViX** — direct Stremio addon call
- **VidLink/VixSrc/MF-VixSrc/NoTorrent/AnimeSaturn/DahmerMovies** — various backend routes

## HDHub URL Types
- `pub-*.r2.dev/*?token=*` — Cloudflare R2 signed URLs, stable tokens, WORK
- `pixeldrain.dev/api/file/*?download` — PixelDrain file hosting, permanent, WORK
- `*.workers.dev/*` — Cloudflare Worker proxy URLs, expire quickly, 403 after ~30s
- Backend now returns both direct AND CF-proxied versions of every URL
