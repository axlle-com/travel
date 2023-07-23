<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

1. Язык программирования: `PHP 8.1`
2. Реляционная база данных `MySQL 5.7`
3. Framework: `Laravel 10`
```
Запуск приложения:
```
1. Клонируем в текущую директорию `git clone git@github.com:axlle-com/base.git .`
2. Создаем базу данных `DATABASE:ax_blog`; `USERNAME:root`; `PASSWORD:`
3. Файл `.env.example` переименовываем в `.env` и заполняем подключение к БД
4. Запускаем команду `composer update` запускать в консоли из папки проекта
5. При проблеме composer `COMPOSER_MEMORY_LIMIT=-1 composer update`
6. Запускаем команду `php artisan migrate` запускать в консоли из папки проекта
7. Если возникли проблемы с базой `database/files/db.sql` можно взять дамп
8. Лежит схема MySQL Workbench `database/files/ax_blog.mwb`, можно развернуть
9. После миграций все базы будут развернуты, тестовый пользователь `login:axlle@mail.ru | password:558088`

```
Работа с валютами:
```
1. Запуск парсера валют за 180 дней (парсит в очереди) `php artisan currency` запускать в консоли из папки проекта
2. Запуск очередей `php artisan queue:work` запускать в консоли из папки проекта
3. Получить все валюты `GET` `/api/v1/currency`
4. Запросить курс валюты за определенный день `GET` `/api/v1/currency-rate?currency={CODE}&date={DATE}`
   пример : `/api/v1/currency-rate?currency=AUD&date=23.07.2023`
```json
{
    "CODE": "required|string",
    "DATE": "nullable|string"
}
```

---
На память
1. `php artisan cache:clear`
2. `php artisan route:clear`
3. `php artisan config:clear`
4. `php artisan view:clear`
---
