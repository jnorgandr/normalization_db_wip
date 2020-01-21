CREATE DATABASE prueba;
\c prueba;
CREATE TABLE customer(
    customer_id INT NOT NULL,
    name VARCHAR(25),
    rut VARCHAR(18) NOT NULL,
    address VARCHAR(100),
    PRIMARY KEY (customer_id)
);
CREATE TABLE invoice(
    invoice_id INT NOT NULL,
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    subtotal INT NOT NULL,
    total_cost INT NOT NULL,
    PRIMARY KEY (invoice_id)
);
CREATE TABLE products(
    product_id INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(100),
    unit_price INT,
    stock INT,
    PRIMARY KEY (product_id)
);
CREATE TABLE category(
    category_id INT NOT NULL,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(100),
    PRIMARY KEY(category_id)
);
CREATE TABLE invoice_item(
    invoice_id INT REFERENCES invoice(invoice_id),
    customer_id INT REFERENCES customer(customer_id)
);
CREATE TABLE invoice_products(
    invoice_id INT REFERENCES invoice(invoice_id),
    product_id INT REFERENCES products(product_id)
);
CREATE TABLE products_list(
    product_id INT REFERENCES products(product_id),
    category_id INT REFERENCES category(category_id)
);



INSERT INTO customer(customer_id, name, rut, address)
    VALUES
        (1, 'Dimitri', '17.776.420-5', '49 North Van Dyke Road
        Beloit, WI 53511'),
        (2, 'Claude', '18.681.145-3', '64 East Street
        Natick, MA 01760'),
        (3, 'Edelgard', '23.347.267-0', '788 Cardinal Lane
        Thornton, CO 80241'),
        (4, 'Lysithea', '33.093.102-7', '561 Augusta St.
        Henderson, KY 42420'),
        (5, 'Mercedes', '21.997.617-8', '72 Pumpkin Hill St.
        Tupelo, MS 38801');

INSERT INTO products(product_id, name, description, unit_price, stock)
    VALUES
        (20, 'Silver Sword', 'A sword crafted from shining silver.', 2200, 30),
        (21, 'Rapier', 'A sword designed to exploit the weaknesses of armored and cavalry units.', 1500, 15),
        (22, 'Javelin', 'A basic ranged lance that can be thrown at distant enemies.', 1200, 25),
        (23, 'Blessed Lance', 'A reinforced blessed lance that is effective against monsters', 2000, 3),
        (24, 'Scythe of Sariel', 'Crafted using archaic methods.', 5000, 1),
        (25, 'Killer Axe', 'Deadly sharp, this axe boasts a high critical-hit rate.', 1800, 20),
        (26, 'Brave Axe', 'The wielder of this axe is emboldened and will attack twice when initiating combat.', 2450, 12),
        (27, 'Freikugel', 'Hero Relic (Crest of Goneril). Crest-bearer can use Apocalyptic Flame.', 10000, 0);

INSERT INTO category(category_id, name, description)
    VALUES
        (1, 'Swords', 'Variety of swords.'),
        (2, 'Lances', 'Variety of lances.'),
        (3, 'Axes', 'Variety of axes.');








        