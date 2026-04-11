# SQL QA Sandbox

Локальная песочница PostgreSQL, разворачиваемая через Docker.
Схема данных специально спроектирована для отработки сложных SQL-запросов (Window Functions, Self
Joins, CTE, Gaps and Islands) уровня LeetCode.

## 1. Системные требования (macOS M1/M2/M3)

Для работы требуются Homebrew, Git и Docker Desktop.
Выполните в терминале:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew install git
brew install --cask docker
brew install pgcli
```

Важно: Откройте приложение Docker из Launchpad и дождитесь запуска Engine (зеленый индикатор),
прежде чем переходить к следующим шагам.

## 2. Запуск базы данных

Запустите контейнер в фоновом режиме. Флаг --wait задержит выполнение до тех пор, пока база не
проинициализируется скриптом init.sql и не пройдет healthcheck.

```bash
docker compose up -d --wait
```

## 3. Подключение к песочнице

Подключитесь напрямую к CLI PostgreSQL (psql) через pgcli (красивый интерфейс для команд постгреса
через терминал):

```bash
pgcli -h localhost -p 5432 -U qa_user -d qa_learning
```

ПАРОЛЬ qa_password

## 4. Остановка и очистка

Остановить контейнер, не удаляя данные:

```bash
docker compose stop
```

Остановить и полностью удалить контейнер вместе с базой (при следующем up скрипт init.sql отработает
заново):

```bash
docker compose down -v
```