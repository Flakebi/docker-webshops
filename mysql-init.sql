CREATE USER 'prestashop'@'%';
CREATE DATABASE IF NOT EXISTS prestashop;
GRANT ALL ON prestashop.* TO 'prestashop'@'%' IDENTIFIED BY 'prestashoppw';

CREATE USER 'opencart'@'%';
CREATE DATABASE IF NOT EXISTS opencart;
GRANT ALL ON opencart.* TO 'opencart'@'%' IDENTIFIED BY 'opencartpw';

CREATE USER 'drupal_commerce'@'%';
CREATE DATABASE IF NOT EXISTS drupal_commerce;
GRANT ALL ON drupal_commerce.* TO 'drupal_commerce'@'%' IDENTIFIED BY 'drupal_commercepw';

CREATE USER 'thelia'@'%';
CREATE DATABASE IF NOT EXISTS thelia;
GRANT ALL ON thelia.* TO 'thelia'@'%' IDENTIFIED BY 'theliapw';

CREATE USER 'oscommerce'@'%';
CREATE DATABASE IF NOT EXISTS oscommerce;
GRANT ALL ON oscommerce.* TO 'oscommerce'@'%' IDENTIFIED BY 'oscommercepw';

CREATE USER 'shopware'@'%';
CREATE DATABASE IF NOT EXISTS shopware;
GRANT ALL ON shopware.* TO 'shopware'@'%' IDENTIFIED BY 'shopwarepw';

CREATE USER 'abantecart'@'%';
CREATE DATABASE IF NOT EXISTS abantecart;
GRANT ALL ON abantecart.* TO 'abantecart'@'%' IDENTIFIED BY 'abantecartpw';

CREATE USER 'cubecart'@'%';
CREATE DATABASE IF NOT EXISTS cubecart;
GRANT ALL ON cubecart.* TO 'cubecart'@'%' IDENTIFIED BY 'cubecartpw';

CREATE USER 'zencart'@'%';
CREATE DATABASE IF NOT EXISTS zencart;
GRANT ALL ON zencart.* TO 'zencart'@'%' IDENTIFIED BY 'zencartpw';

CREATE USER 'thirtybees'@'%';
CREATE DATABASE IF NOT EXISTS thirtybees;
GRANT ALL ON thirtybees.* TO 'thirtybees'@'%' IDENTIFIED BY 'thirtybeespw';

CREATE USER 'litecart'@'%';
CREATE DATABASE IF NOT EXISTS litecart;
GRANT ALL ON litecart.* TO 'litecart'@'%' IDENTIFIED BY 'litecartpw';

CREATE USER 'moodle'@'%';
CREATE DATABASE IF NOT EXISTS moodle;
GRANT ALL ON moodle.* TO 'moodle'@'%' IDENTIFIED BY 'moodlepw';

CREATE USER 'avactis'@'%';
CREATE DATABASE IF NOT EXISTS avactis;
GRANT ALL ON avactis.* TO 'avactis'@'%' IDENTIFIED BY 'avactispw';

CREATE USER 'xcart'@'%';
CREATE DATABASE IF NOT EXISTS xcart;
GRANT ALL ON xcart.* TO 'xcart'@'%' IDENTIFIED BY 'xcartpw';

CREATE USER 'alegrocart'@'%';
CREATE DATABASE IF NOT EXISTS alegrocart;
GRANT ALL ON alegrocart.* TO 'alegrocart'@'%' IDENTIFIED BY 'alegrocartpw';

CREATE USER 'arastta'@'%';
CREATE DATABASE IF NOT EXISTS arastta;
GRANT ALL ON arastta.* TO 'arastta'@'%' IDENTIFIED BY 'arasttapw';
