---
title: 'PostgreSQL'
date: 2020-06-08T06:00:20+06:00
hero: /images/material/svg/2.svg
menu:
  sidebar:
    name: PostgreSQL
    identifier: PostgreSQL
    parent: notes
    weight: 10
---

### Installation for MAC

<https://www.enterprisedb.com/downloads/postgres-postgresql-downloads>

### Migrate from MySQL to PostgreSQL

- Install Pgloader

```shell
brew install pgloader
```

pgloader mysql://root:asd19960803+1S@localhost/asset_web_manager postgresql://postgres:asd19960803+1S@localhost/asset_web_manager

- migrate
