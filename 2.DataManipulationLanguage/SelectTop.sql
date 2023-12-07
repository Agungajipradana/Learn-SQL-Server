/*
Dalam SQL Server, SELECT TOP digunakan untuk membatasi jumlah baris yang dikembalikan oleh sebuah query. 
Ini berguna ketika Anda hanya ingin melihat sejumlah kecil baris dari hasil query atau ketika Anda ingin
mengambil sejumlah baris teratas dari hasil query yang diurutkan.

Berikut adalah sintaksis umum dari SELECT TOP:

	SELECT TOP (expression) column1, column2, ...
	FROM table_name
	WHERE condition
	ORDER BY column1, column2, ...;

	- expression: Jumlah baris yang ingin Anda kembalikan.
	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- WHERE condition: Kondisi untuk memfilter baris yang akan diambil (opsional).
	- ORDER BY column1, column2, ...: Kondisi pengurutan untuk menentukan urutan hasil query (opsional).

Contoh penggunaan SELECT TOP:

	-- Mengambil 5 baris teratas dari tabel 'Orders' yang diurutkan berdasarkan 'OrderDate' secara descending
	SELECT TOP (5) OrderID, CustomerID, OrderDate
	FROM Orders
	ORDER BY OrderDate DESC;

Dalam contoh di atas, hasil query akan mengembalikan 5 baris teratas dari tabel Orders yang diurutkan 
berdasarkan kolom OrderDate secara descending.

Note: Sejak SQL Server 2005, disarankan untuk menggunakan klausa ORDER BY ketika menggunakan TOP untuk memastikan hasil query 
yang diinginkan. Tanpa klausa ORDER BY, urutan baris yang dikembalikan mungkin tidak konsisten.


Perintah SQL Server dengan menggunakan SELECT TOP memiliki perbedaan antara menggunakan WITH TIES dan tanpa WITH TIES. 
Mari kita lihat perbedaan tersebut dengan contoh yang di berikan:

Menggunakan WITH TIES:

	SELECT TOP (5) WITH TIES barang_name, total, price
	FROM barang5
	ORDER BY barang_name DESC;

Tanpa WITH TIES:

	SELECT TOP (5) barang_name, total, price
	FROM barang5
	ORDER BY barang_name DESC;

Perbedaan:

	1.Dengan WITH TIES:
		- Jika ada beberapa baris yang memiliki nilai yang sama dengan baris terakhir dalam urutan, 
		maka semua baris tersebut akan dimasukkan dalam hasil query.
		- Contoh: Jika ada beberapa baris dengan nilai barang_name yang sama seperti baris terakhir, 
		maka semua baris tersebut akan disertakan dalam hasil query.

	2.Tanpa WITH TIES:
		- Hanya akan mengambil lima baris teratas sesuai dengan klausa TOP, 
		bahkan jika ada beberapa baris yang memiliki nilai yang sama dengan baris terakhir.
		- Contoh: Jika ada beberapa baris dengan nilai barang_name yang sama seperti baris terakhir, 
		hanya lima baris pertama yang akan disertakan dalam hasil query.

Jadi, perbedaannya terletak pada cara pengelolaan baris yang memiliki nilai yang sama dengan baris terakhir dalam urutan. 
Dengan WITH TIES, semua baris tersebut akan dimasukkan, sementara tanpa WITH TIES, hanya batasan jumlah baris yang akan diterapkan.
*/

select * from barang5 

-- menampilkan 3 data teratas dari total semua data pada table "barang5" dengan menggunakan perintah "select top 3"
select top 3 * from barang5

-- menampilkan 30 persen data dari total semua data pada table "barang5" dengan menggunakan perintah "select top 30 percent"
select top 30 percent * from barang5

-- menampilkan semua data pada table "barang5" dengan 
-- "order by" agar mengurutkan hasil query berdasarkan column discount secara ascending (ASC).
select * from barang5 
order by discount asc

-- "select top 3 with ties": Mengembalikan tiga baris teratas dari hasil query. 
-- Jika ada baris yang memiliki nilai yang sama dengan baris terakhir, baris-baris tersebut juga akan dimasukkan.
-- Yang diambil semua column dari tabel "barang5".
-- "order by discount asc": Mengurutkan hasil query berdasarkan kolom discount secara ascending (ASC).
select top 3 with ties * from barang5
order by discount asc

-- menampilkan semua data pada table "barang5" dengan 
-- "order by" agar mengurutkan hasil query berdasarkan column discount secara descending (DESC).
select * from barang5 
order by discount desc

-- "select top 3 with ties": Mengembalikan tiga baris teratas dari hasil query. 
-- Jika ada baris yang memiliki nilai yang sama dengan baris terakhir, baris-baris tersebut juga akan dimasukkan.
-- Yang diambil semua column dari tabel "barang5".
-- "order by discount desc": Mengurutkan hasil query berdasarkan kolom discount secara descending (DESC).
select top 3 with ties * from barang5
order by discount desc

-- menghapus data pada table "barang5" pada column "barang_id=20"
DELETE FROM barang5
WHERE barang_id = 20;

-- Menggunakan WITH TIES:
-- SELECT TOP (5) WITH TIES: Mengambil lima baris teratas dari hasil query.
-- barang_name, total, price: Kolom-kolom yang ingin Anda ambil dari tabel.
-- FROM barang5: Menentukan tabel yang akan digunakan untuk mengambil data.
-- ORDER BY barang_name DESC: Mengurutkan hasil query berdasarkan kolom barang_name secara descending (DESC).
-- WITH TIES: Opsi ini memastikan bahwa jika ada beberapa baris yang memiliki nilai yang sama dengan baris terakhir dalam urutan 
-- (dalam hal ini, baris teratas), maka semua baris tersebut akan dimasukkan dalam hasil query.
select top (5) with ties barang_name, total, price
from barang5
order by barang_name desc

-- Tanpa WITH TIES:
-- SELECT TOP (5): Mengambil lima baris teratas dari hasil query tanpa mempertimbangkan baris-baris yang memiliki nilai yang sama 
-- dengan baris terakhir.
-- barang_name, total, price: Kolom-kolom yang ingin Anda ambil dari tabel.
-- FROM barang5: Menentukan tabel yang akan digunakan untuk mengambil data.
-- ORDER BY barang_name DESC: Mengurutkan hasil query berdasarkan kolom barang_name secara descending (DESC).
-- Tanpa WITH TIES, hanya batasan jumlah baris yang akan diterapkan, dan baris-baris yang memiliki nilai yang sama 
-- dengan baris teratas tidak akan dimasukkan.
select top (5) barang_name, total, price
from barang5
order by barang_name desc
