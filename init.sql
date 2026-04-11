CREATE TABLE departments
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    salary        INT,
    department_id INT,
    manager_id    INT,
    hire_date     DATE
);

CREATE TABLE sales
(
    id          SERIAL PRIMARY KEY,
    employee_id INT,
    sale_date   DATE,
    amount      INT
);

CREATE TABLE attendance
(
    id          SERIAL PRIMARY KEY,
    employee_id INT,
    record_date DATE
);

INSERT INTO departments (id, name)
VALUES (1, 'IT'),
       (2, 'Sales'),
       (3, 'Executive');

INSERT INTO employees (id, name, salary, department_id, manager_id, hire_date)
VALUES (1, 'Alice', 90000, 3, NULL, '2020-01-15'),
       (2, 'Bob', 85000, 1, 1, '2020-02-10'),
       (3, 'Charlie', 85000, 1, 2, '2020-03-01'),
       (4, 'Diana', 70000, 1, 2, '2021-06-15'),
       (5, 'Eve', 60000, 2, 1, '2021-10-20'),
       (6, 'Frank', 60000, 2, 5, '2022-01-10'),
       (7, 'Grace', 55000, 2, 5, '2022-02-20'),
       (8, 'Henry', 40000, NULL, NULL, '2023-01-01');

INSERT INTO sales (id, employee_id, sale_date, amount)
VALUES (1, 5, '2023-01-15', 1000),
       (2, 5, '2023-02-10', 1500),
       (3, 5, '2023-02-20', 800),
       (4, 6, '2023-01-05', 2000),
       (5, 6, '2023-02-15', 500),
       (6, 7, '2023-01-20', 1200),
       (7, 7, '2023-02-25', 900),
       (8, 7, '2023-02-28', 1100);

INSERT INTO attendance (id, employee_id, record_date)
VALUES (1, 2, '2023-10-01'),
       (2, 2, '2023-10-02'),
       (3, 2, '2023-10-03'),
       (4, 2, '2023-10-05'),
       (5, 2, '2023-10-06'),
       (6, 3, '2023-10-01'),
       (7, 3, '2023-10-02');

SELECT setval('departments_id_seq', (SELECT MAX(id) FROM departments));
SELECT setval('employees_id_seq', (SELECT MAX(id) FROM employees));
SELECT setval('sales_id_seq', (SELECT MAX(id) FROM sales));
SELECT setval('attendance_id_seq', (SELECT MAX(id) FROM attendance));