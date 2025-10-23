linux-commands.md

# Linux команды для SOC 

## Логи и systemd/journald
- `journalctl -p err -b` — ошибки текущей загрузки
- `journalctl -u ssh --since "-1h"` — события ssh за час
- `systemctl status <unit>` / `systemctl restart <unit>` — статус/перезапуск

## Сеть и процессы
- `ss -tulpn` — кто слушает порты
- `ss -tnp state established` — активные TCP-сессии
- `ps aux --sort=-%cpu | head` — самые «горячие» по CPU
- `top` — интерактивный мониторинг

## Поиск по логам
- `grep -Rni "error\|fail" /var/log`
- `tail -f /var/log/auth.log` — «живой» хвост

## Права
- `chmod 640 file`
- `chown root:adm file`
