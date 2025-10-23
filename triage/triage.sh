#!/usr/bin/env bash
set -euo pipefail
OUT="triage-$(hostname)-$(date +%F_%H%M%S)"
mkdir -p "$OUT"
{
  echo "=== SYSTEM ==="; uname -a; whoami; id; date; echo
  echo "=== LAST LOGINS ==="; last -n 20; echo
  echo "=== NETWORK (ss) ==="; ss -tulpn; ss -tnp state established; echo
  echo "=== TOP PROCESSES ==="; ps aux --sort=-%cpu | head -n 15; ps aux --sort=-%mem | head -n 15; echo
  echo "=== JOURNAL ERRORS (boot) ==="; journalctl -p err -b | tail -n 500; echo
  echo "=== AUTH LOG (tail) ==="; [ -f /var/log/auth.log ] && tail -n 300 /var/log/auth.log || true
} > "$OUT/triage.txt"
tar -czf "$OUT.tar.gz" "$OUT"
echo "Saved: $OUT.tar.gz"
