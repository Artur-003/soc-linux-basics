# systemd / journald заметки

- По сервису:
  - `systemctl status <unit>`
  - `systemctl restart <unit>`
  - `journalctl -u <unit> --since "-1h"`
- Автозапуск и список юнитов:
  - `systemctl is-enabled <unit>`
  - `systemctl list-unit-files --type=service`
