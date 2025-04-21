-- 1. Найти заказчиков и обслуживающих их заказы сотрудников таких, что и заказчики и сотрудники из города London,
-- а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.
SELECT c.company_name, CONCAT(e.first_name, ' ', e.last_name) AS employee
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
         JOIN employees e ON e.employee_id = o.employee_id
         JOIN shippers s ON o.ship_via = s.shipper_id
WHERE c.city = 'London'
  AND e.city = 'London'
  AND s.company_name = 'Speedy Express';

-- 2. Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц.
-- Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.
SELECT p.product_name, p.units_in_stock, s.contact_name, s.phone
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE p.discontinued = 0
AND c.category_name IN ('Beverages', 'Seafood')
AND p.units_in_stock < 20;

-- 3. Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.
SELECT c.contact_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4. Переписать предыдущий запрос, использовав симметричный вид джойна (подсказка: речь о LEFT и RIGHT).
SELECT c.contact_name, o.order_id
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;