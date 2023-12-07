/*
OFFSET dan FETCH adalah klausa-klausa yang digunakan dalam SQL Server untuk mengimplementasikan fungsi paging pada hasil query. 
Ini memungkinkan Anda untuk mengambil sejumlah baris tertentu dari hasil query, yang berguna ketika Anda ingin membagi hasil query 
menjadi beberapa halaman.

Berikut adalah contoh penggunaan OFFSET dan FETCH:

	SELECT column1, column2, ...
	FROM table_name
	ORDER BY some_column
	OFFSET {number_of_rows} ROWS
	FETCH {number_of_rows} ROWS ONLY;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- ORDER BY some_column: Klausa ORDER BY untuk menentukan kolom yang digunakan untuk pengurutan hasil query.
	- OFFSET {number_of_rows} ROWS: Menentukan jumlah baris yang akan dilewati sebelum mengambil hasil. 
	{number_of_rows} adalah jumlah baris yang ingin dilewati.
	- FETCH {number_of_rows} ROWS ONLY: Menentukan jumlah baris yang akan diambil dari hasil setelah pengaturan OFFSET. 
	{number_of_rows} adalah jumlah baris yang ingin diambil.

Contoh penggunaan OFFSET dan FETCH:

	-- Mengambil 5 baris, dimulai dari baris ke-6, dari tabel 'Products' yang diurutkan berdasarkan kolom 'ProductName'
	SELECT ProductID, ProductName
	FROM Products
	ORDER BY ProductName
	OFFSET 5 ROWS
	FETCH 5 ROWS ONLY;

Pernyataan di atas akan mengambil 5 baris dari hasil query setelah melewati 5 baris pertama, 
sehingga memberikan efek halaman ke-2 dari hasil query.
*/

select * from barang5
order by discount desc, barang_name asc

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "discount" secara DESC dan "barang_name" secara ASC.
-- menggunakan perintah "offset 2 rows" yang digunakan untuk menentukan jumlah baris yang akan dilewati sebelum mengambil hasil. 
-- data yang dihasilkan adalah dimulai dari rows/baris ke tiga hingga seterusnya
select * from barang5
order by discount desc, barang_name asc
offset 2 rows

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "discount" secara DESC dan "barang_name" secara ASC.
-- Menggunakan perintah "offset 2 rows" yang digunakan untuk Melewati dua baris pertama dari hasil query. 
-- Dengan kata lain, memulai dari baris ketiga.
-- Menggunakan perintah "fetch next 3 rows only" untuk mengambil tiga baris berikutnya setelah baris yang dilewati. 
-- Sehingga hasilnya adalah tiga baris mulai dari baris ketiga.
select * from barang5
order by discount desc, barang_name asc
offset 2 rows 
fetch next 3 rows only

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "discount" secara DESC dan "barang_name" secara ASC.
-- Menggunakan perintah "offset 0 rows" Secara teknis, tidak ada efek karena OFFSET 0 ROWS menandakan bahwa kita tidak melewati 
-- atau melewati baris mana pun. Ini berfungsi lebih sebagai bentuk sintaksis standar yang dapat digunakan dalam skrip atau query, 
-- tetapi tidak ada perubahan efektif terhadap hasil query.
-- Menggunakan perintah "fetch next 3 rows only" untuk mengambil tiga baris berikutnya setelah baris yang dilewati. 
-- Sehingga hasilnya adalah tiga baris mulai dari baris ketiga.
select * from barang5
order by discount desc, barang_name asc
offset 0 rows 
fetch next 3 rows only

-- memasukan data kedalam tabel "barang5"
insert into barang5 (barang_name, total, price, discount) values ('AC Samsung 2 PK', 10, 6500000, 1000000)
insert into barang5 (barang_name, total, price, discount) values ('Camera canon DSLR', 7, 8000000, 800000)
insert into barang5 (barang_name, total, price, discount) values ('Speaker JBL Mini', 5, 750000, 50000)
insert into barang5 (barang_name, total, price, discount) values ('Television LG 20 Inc', 5, 5000000, 500000)
insert into barang5 (barang_name, total, price, discount) values ('Speaker Harman Onyx Studio 7', 10, 5500000, 550000)
insert into barang5 (barang_name, total, price, discount) values ('Keyboard Fantech Gaming', 15, 2200000, 250000)

-- menampilkan semua data pada tabel "barang5" dan  
-- menggunakan perintah order by pada column "barang_name" secara ASC.
-- Menggunakan perintah "offset 0 rows" Secara teknis, tidak ada efek karena OFFSET 0 ROWS menandakan bahwa kita tidak melewati 
-- atau melewati baris mana pun. Ini berfungsi lebih sebagai bentuk sintaksis standar yang dapat digunakan dalam skrip atau query, 
-- tetapi tidak ada perubahan efektif terhadap hasil query.
-- Menggunakan perintah "fetch next 10 rows only" untuk mengambil sepuluh baris berikutnya setelah baris yang dilewati. 
-- Sehingga hasilnya adalah sepuluh baris mulai dari baris nol.
SELECT *FROM barang5
ORDER BY barang_name asc
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;
