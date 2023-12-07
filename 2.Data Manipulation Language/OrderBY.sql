/*
Dalam SQL Server, klausa ORDER BY digunakan untuk mengurutkan hasil query berdasarkan satu atau lebih kolom. 
Klausa ini memungkinkan Anda untuk mengendalikan urutan hasil yang dikembalikan oleh query, baik secara ascending (ASC) atau 
descending (DESC).

Berikut adalah sintaksis dasar dari klausa ORDER BY:

	SELECT column1, column2, ...
	FROM table_name
	ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- ORDER BY column1 [ASC | DESC], column2 [ASC | DESC], ...: Klausa ORDER BY yang menentukan kolom-kolom dan urutannya. 
	Defaultnya adalah ascending (ASC), tetapi Anda dapat menentukan descending (DESC) jika diinginkan.

Contoh penggunaan ORDER BY:

	-- Mengambil semua kolom dari tabel 'Products' dan mengurutkannya berdasarkan kolom 'ProductName' secara ascending
	SELECT * FROM Products
	ORDER BY ProductName ASC;

	-- Mengambil kolom 'FirstName' dan 'LastName' dari tabel 'Employees' dan mengurutkannya berdasarkan kolom 'LastName' secara descending
	SELECT FirstName, LastName FROM Employees
	ORDER BY LastName DESC;

Dalam kedua contoh di atas, hasil query diurutkan berdasarkan kolom yang disebutkan dalam klausa ORDER BY.

Penting untuk diingat bahwa ORDER BY umumnya digunakan setelah klausa SELECT dan sebelum klausa lain seperti LIMIT, OFFSET, 
atau GROUP BY, dan mempengaruhi hasil akhir yang dikembalikan oleh query.
*/

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "barang_name" untuk mengurutkan nilai secara (DESC) dari nilai terbesar hingga terkecil 
select * from barang5
order by barang_name desc

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "barang_name", tetapi karna order by tidak didefinisikan "ASC" atau "DESC" 
-- maka "order by" akan mengurutkan nilai secara default (ASC) dari nilai terkecil hingga terbesar 
select * from barang5
order by barang_name

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "discount" secara DESC dan "barang_name" secara ASC
-- karena "order by" terdapat 2 yaitu pada column "discount" dan "barang_name"
-- maka hasil query akan diurutkan pertama column "discount" secara descending (DESC), 
-- dan jika ada nilai yang sama dalam column "discount", maka nilai-nilai tersebut akan diurutkan berdasarkan 
-- column barang_name secara ascending (ASC).
select * from barang5
order by discount desc, barang_name asc