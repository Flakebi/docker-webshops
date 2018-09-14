# Webshops

If you ever come into the situation, that you need a bunch of webshops to train a neural network on them,
this repository may help you. It contains a bunch of webshops that can be installed for free inside docker containers.

All containers can be built and started with `docker-compose up`.
After starting the docker containers, you still need to install most of the shops.
E. g. entering the database connection, which runs on the host `db`. The username
is usually the shopname and the password is the shopname + pw, if you are unsure,
take a look into the `mysql-init.sql` file.

For security reasons, please **do not** make these containers available publicly
on the internet. The default passwords are far from secure.

# Prerequisits

To use some of the shops, you need to assign them a domain. Additionally some websites
only work with http but not with https.

# Demo sites

| Shop               | Port | Admin user              | password        |
|--------------------|------|-------------------------|-----------------|
| PrestaShop         | 8001 | presta.shop@example.com | prestashop      |
| OpenCart           | 8002 | user                    | bitnami1        |
| Spree              | 8003 |                         |                 |
| commerce-kickstart | 8004 | admin                   | admin           |
| oscommerce         | 8005 | admin                   | admin           |
| thelia             | 8006 | admin                   | admin           |
| seotoaster         | 8007 | admin@changeme.com      | password        |
| shopware           | 8008 | demo                    | demopw          |
| AbanteCart         | 8009 | admin                   | adminpw         |
| cubecart           | 8010 | admin                   | admin           |
| zen cart           | 8013 | admin                   |                 |
| thirty bees        | 8014 | admin@example.com       | thirtybees      |
| litecart           | 8015 | admin                   | admin           |
| avactis            | 8017 | admin@example.com       |                 |
| x-cart             | 8018 |                         | admin           |
| Quick.Cart         | 8019 |                         |                 |
| AlegroCart         | 8020 | admin                   | admin           |
| Arastta            | 8021 | admin@example.com       | admin           |

## Mysql

The database is setup in mysql-init.sql. You can connect from the docker host with `mysql -h 127.0.0.1 -P 3307 -u root -prootpw`.

## How to add a site

1. If the webshop needs a MySQL database, add it into the `mysql-init.sql` file and execute the same commands on the database to avoid rebuilding the mysql container and loosing the data of all shops.
1. Add the server to the docker-compose.yml file with a new port
1. Add the domain to the dns database (`mysql -h <ip of dns_db_1> -P 3306 -u root -prootpw`) in the `records` table
1. Start the new site with `docker-compose up <name>`

## Other notes

The ip of the `dns_db_1` container can be found with `docker inspect dns_db_1`.

Avactis needs a modified database, so you need to run `ALTER TABLE asc_module MODIFY module_system VARCHAR(255) NOT NULL DEFAULT '0';` on the avactis database.

Magento was working but it has no demo content and redirects to https, therefor it was dropped.

Blesta is not really a shop and it only has a 30 day trial so it is not included.
