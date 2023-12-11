/*
Pada SQL Server, klausa BETWEEN digunakan untuk memfilter hasil query berdasarkan suatu rentang nilai tertentu. 
Klausa ini biasanya digunakan dalam pernyataan WHERE untuk menyaring baris yang memiliki nilai di antara dua nilai yang ditentukan.

Sintaksis umum BETWEEN adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table_name
	WHERE column_name BETWEEN value1 AND value2;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- column_name: Kolom yang akan diuji apakah nilainya berada di antara dua nilai tertentu.
	- value1 dan value2: Rentang nilai yang digunakan sebagai batas untuk memfilter.

Contoh penggunaan BETWEEN:

	SELECT * FROM employees
	WHERE salary BETWEEN 50000 AND 70000;

Contoh di atas akan mengambil semua baris dari tabel "employees" di mana nilai kolom "salary" berada di antara 50000 dan 70000.

Penting untuk dicatat bahwa batasan dalam klausa BETWEEN bersifat inklusif, yang berarti bahwa nilai batas tersebut juga akan 
disertakan dalam hasil query. Artinya, dalam contoh di atas, baris dengan gaji 50000 atau 70000 akan masuk dalam hasil.
*/

select * from barang6

-------------------------------------------------------- BETWEEN ---------------------------------------------------------------------- 

-- menampilkan semua data pada tabel "barang6" dimana pada column "price" between 50000 and 100000
-- akan menampilkan data antara 50000 dan 100000
select * from barang6 
where price between 50000 and 100000

-- pada cara penggunaan between diatas, sama seperti pada cara dibawah dengan menggunakan (<=), (>=), dan operator "AND"
select * from barang6 
where price >= 50000 and price <= 100000

------------------------------------------------------- NOT BETWEEN -------------------------------------------------------------------

-- menampilkan semua data pada tabel "barang6" dimana pada column "price" not between 50000 and 100000
-- akan menampilkan data tidak di antara 50000 dan 100000
select * from barang6 
where price not between 50000 and 100000

-- pada cara penggunaan not between diatas, sama seperti pada cara dibawah dengan menggunakan (<), (>), dan opertor "OR"
select * from barang6 
where price < 50000 or price > 100000