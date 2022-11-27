## Команды:
```
docker-compose -f docker-compose.yml up -d --build

docker-compose -f docker-compose.yml exec backend python manage.py collectstatic --no-input --clear

```
```
curl localhost:5001/api/v1/stocks/

curl localhost:5001/api/v1/products/
```
