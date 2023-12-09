/*
Operasi AND pada SQL Server adalah salah satu operator logika yang digunakan untuk menyusun kondisi yang memerlukan dua atau 
lebih kondisi untuk memenuhi suatu persyaratan. Operasi AND memberikan hasil TRUE hanya jika semua kondisi yang diberikan bersamaan 
dengan TRUE.

Sintaksis umum operasi AND dalam pernyataan WHERE adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table_name
	WHERE condition1 AND condition2 AND ...;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- condition1, condition2, ...: Kondisi-kondisi yang harus dipenuhi. Semua kondisi ini dihubungkan dengan operator AND, dan 
	baris akan dipilih hanya jika semua kondisi bernilai TRUE.

Contoh penggunaan operasi AND:

	SELECT * FROM employees
	WHERE salary > 50000 AND department = 'IT';

Contoh di atas akan mengambil semua baris dari tabel employees di mana gajinya lebih dari 50000 dan departemennya adalah 'IT'.

Penting untuk diingat bahwa dengan operasi AND, semua kondisi yang diberikan harus terpenuhi untuk mendapatkan hasil yang sesuai. 
Jika salah satu kondisi tidak terpenuhi, baris tidak akan disertakan dalam hasil query.
*/

select * from barang5

-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=2" akan menampilkan nilai 2 AND 
-- pada column "total=10" akan menampilkan nilai 10
select * from barang5 where barang_id=2 and total=10

-- menampilkan semua data pada tabel "barang5" yang dimana pada column "barang_id=2" AND pada column "total=11" 
-- tidak akan menghasilkan nilai apapun karena operasi AND, keduanya harus bernilai "true"
select * from barang5 where barang_id=2 and total=11

/*
Syarat penggunaan Operasi AND:

	- TRUE	 AND  TRUE   = TRUE
	- TRUE	 AND  FALSE  = FALSE
	- FALSE  AND  TRUE   = FALSE
	- FALSE  AND  FALSE  = FALSE
*/