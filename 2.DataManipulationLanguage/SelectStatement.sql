/*
Pada SQL Server, pernyataan SELECT digunakan untuk mengambil atau menampilkan data dari satu atau lebih tabel dalam basis data. 
Ini adalah salah satu pernyataan paling dasar dan umum digunakan dalam bahasa SQL. Pernyataan SELECT juga sering digunakan untuk 
melakukan operasi seperti pengelompokan data, pengurutan, dan penggabungan data dari berbagai sumber.

Berikut adalah sintaksis dasar pernyataan SELECT:

	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

	- column1, column2, ...: Nama kolom atau ekspresi yang ingin Anda ambil atau tampilkan.
	- table_name: Nama tabel dari mana data akan diambil.
	- WHERE condition: (Opsional) Kondisi yang digunakan untuk memfilter baris yang akan diambil.

Contoh penggunaan pernyataan SELECT:

	-- Mengambil semua kolom dari tabel 'Employees'
	SELECT * FROM Employees;

	-- Mengambil hanya kolom 'FirstName' dan 'LastName' dari tabel 'Employees'
	SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;

Pernyataan SELECT juga dapat digunakan untuk melakukan berbagai operasi lain, seperti:

	- Penggabungan (JOIN): Menggabungkan data dari dua atau lebih tabel berdasarkan kondisi tertentu.

		SELECT Orders.OrderID, Customers.CustomerName
		FROM Orders
		INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

	- Pengelompokan (GROUP BY): Mengelompokkan data berdasarkan nilai kolom tertentu.

		SELECT DepartmentID, AVG(Salary) AS AverageSalary
		FROM Employees
		GROUP BY DepartmentID;

	- Pengurutan (ORDER BY): Mengurutkan hasil query berdasarkan satu atau lebih kolom.

		SELECT ProductName, Price
		FROM Products
		ORDER BY Price DESC;
*/

-- menampilkan semua data pada tabel "barang5" dengan perintah "select * from"
select * from barang5

-- menampilkan semua data pada tabel "barang5" yang memiliki column "barang_id=3" dengan perintah "select * from" dan where
select * from barang5 
where barang_id=3

-- menampilkan semua data pada tabel "barang5" yang dimana "where" column "barang_id > 2" 
-- dan menggunakan perintah order by pada column "total" untuk mengurutkan dari total terkecil hingga terbesar
select * from barang5 
where barang_id > 2 
order by total

-- menampilkan data pada column "barang_id", "barang_name", "total", "price" pada tabel "barang5" 
-- yang dimana "where" column "barang_id > 2" 
-- dikelompokan berdasarkan column "barang_id", "barang_name", "total", "price"
-- dan menggunakan perintah order by pada column "total" untuk mengurutkan nilai secara default (ASC) dari nilai terkecil hingga terbesar
select barang_id, barang_name, total, price 
from barang5 
where barang_id > 2 
group by barang_id, barang_name, total, price 
order by total 

