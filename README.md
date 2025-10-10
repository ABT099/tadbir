# Tadbir

### Prerequisites

- Docker  
- Docker Compose  

---

### Start the Application

```bash
docker-compose up
````

The API will be available at: [http://localhost:3000](http://localhost:3000)

---

# Other Docker Commands

### Start with Rebuild (when dependencies change)

```bash
docker-compose up --build
```

---

### View Logs

```bash
docker-compose logs -f app
```

---

### Stop the Application

```bash
docker-compose down
```

---

### Stop and Remove Volumes (fresh database)

```bash
docker-compose down -v
```

---

## Working with the Database

The PostgreSQL database is available at:

* **Host:** localhost
* **Port:** 5432
* **Username:** postgres
* **Password:** postgres
* **Database:** myapp
