FROM caddy:2.1.1-builder AS builder

# Add the DNS provider for Cloudflare
RUN caddy-builder github.com/caddy-dns/cloudflare

  
FROM caddy:2.1.1-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 443
EXPOSE 80