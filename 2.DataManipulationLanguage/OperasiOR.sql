/*
Operasi OR pada SQL Server adalah operator logika yang digunakan untuk menyusun kondisi di mana setidaknya satu dari dua atau 
lebih kondisi harus terpenuhi untuk memenuhi persyaratan. Operasi OR memberikan hasil TRUE jika salah satu atau lebih kondisi 
yang diberikan bernilai TRUE.

Sintaksis umum operasi OR dalam pernyataan WHERE adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table_name
	WHERE condition1 OR condition2 OR ...;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- condition1, condition2, ...: Kondisi-kondisi yang harus dipenuhi. 
	Kondisi-kondisi ini dihubungkan dengan operator OR, dan baris akan dipilih jika setidaknya satu dari kondisi tersebut bernilai TRUE.

Contoh penggunaan operasi OR:

	SELECT * FROM employees
	WHERE salary > 50000 OR department = 'IT';

Contoh di atas akan mengambil semua baris dari tabel employees di mana gajinya lebih dari 50000 atau departemennya adalah 'IT'.

Dengan operasi OR, cukup satu kondisi yang harus terpenuhi untuk mendapatkan hasil yang sesuai. Jika kedua kondisi bernilai FALSE, 
baris tidak akan disertakan dalam hasil query.
*/

select * from barang5

-- TRUE OR TRUE = TRUE
-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=3" akan menampilkan nilai 3 OR 
-- pada column "total=10" akan menampilkan data yang memiliki nilai total 10
select * from barang5 where barang_id=3 or total=10

-- TRUE OR FALSE = TRUE
-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=3" akan menampilkan nilai 3 OR 
-- pada column "total=12" tidak akan menampilkan data karena total 12 tidak ada pada tabel "barang5"
-- tetapi data akan tetap ditampilkan karena jika salah satu datanya ada maka akan tetap ditampilkan
select * from barang5 where barang_id=3 or total=12

-- FALSE OR TRUE = TRUE
-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=1" tidak akan menampilkan data 
-- karena barang_id 1 tidak ada pada tabel "barang5" OR
-- pada column "total=10" akan menampilkan data yang memiliki nilai total 10
-- tetapi data akan tetap ditampilkan karena jika salah satu datanya ada maka akan tetap ditampilkan
select * from barang5 where barang_id=1 or total=10


-- FALSE OR FALSE = FALSE
-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=1" tidak akan menampilkan data 
-- karena barang_id 1 tidak ada pada tabel "barang5" OR
-- pada column "total=12" tidak akan menampilkan data karena total 12 tidak ada pada tabel "barang5"
-- dan data tidak akan ditampilkan karena kedua datanya tidak ada 
select * from barang5 where barang_id=1 or total=12

/*
Syarat penggunaan Operasi OR:

	- TRUE	OR TRUE   = TRUE
	- TRUE	OR FALSE  = TRUE
	- FALSE OR TRUE   = TRUE
	- FALSE OR FALSE  = FALSE
*/