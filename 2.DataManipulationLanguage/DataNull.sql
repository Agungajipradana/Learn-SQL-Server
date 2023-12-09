/*
Data NULL pada SQL Server mewakili nilai yang tidak diketahui atau tidak ada nilai. 
Ini berbeda dengan nilai kosong ('') atau nilai nol (0). Ketika suatu kolom memiliki nilai NULL, itu berarti nilai untuk 
kolom tersebut tidak diketahui atau tidak relevan dalam konteks tertentu.

Beberapa poin penting tentang NULL di SQL Server:

	1.NULL bukan nol atau string kosong:
		- NULL adalah keadaan di mana nilai tidak ada atau tidak diketahui, sedangkan nol (0) atau 
		string kosong ('') adalah nilai yang valid.

	2.Dapat diterapkan pada berbagai tipe data:
		- NULL dapat diterapkan pada berbagai tipe data, termasuk numerik, karakter, tanggal, dan lainnya.
	
	3.Penting untuk memeriksa keberadaan NULL:
		- Kondisi IS NULL atau IS NOT NULL digunakan untuk memeriksa apakah suatu kolom memiliki nilai NULL atau tidak.

		SELECT * FROM table_name WHERE column_name IS NULL;

	4.Penggunaan dalam operasi matematika:
		- Jika ada nilai NULL dalam operasi matematika, hasilnya akan menjadi NULL.

		SELECT column1 + column2 FROM table_name; -- Jika salah satu kolom bernilai NULL, hasilnya NULL

	5.Penting dalam desain basis data:
		- Desain basis data harus mempertimbangkan kemungkinan nilai NULL untuk menggambarkan keadaan ketidakpastian atau 
		ketidaktersediaan data.

Contoh:

	CREATE TABLE example (
		id INT,
		name VARCHAR(50) NULL
	);

	INSERT INTO example (id, name) VALUES (1, 'John');
	INSERT INTO example (id, name) VALUES (2, NULL);

Dalam contoh di atas, kolom name memiliki nilai NULL pada baris kedua, menunjukkan bahwa nilai nama tidak diketahui atau 
tidak relevan dalam kasus itu.
*/

select * from barang5

-- memasukkan data pada table "barang5" dan pada column "discount" datanya "null"
insert into barang5 (barang_name, total, price, discount) values ('Mouse Logitech L200', 10, 200000, null)
insert into barang5 (barang_name, total, price, discount) values ('Cable AUX', 10, 50000, null)

-- menampilkan semua data pada table "barang5" dimana pada column "discount" is null 
-- untuk mencari yang datanya null pada column "discount"
select * from barang5 where discount is null

-- menampilkan semua data pada table "barang5" dimana pada column "discount" is not null 
-- untuk mencari yang datanya not null pada column "discount"
select * from barang5 where discount is not null

-- ISNULL(discount, 0) AS dsct: Fungsi ISNULL mengembalikan nilai kedua jika nilai pertama adalah NULL. 
-- Dalam hal ini, kita menggantikan nilai NULL dalam kolom discount dengan nilai 0. Alih-alih menunjukkan nilai NULL, 
-- kolom ini sekarang akan menunjukkan 0. Klausa AS dsct memberikan nama baru pada hasil query untuk kolom ini.
-- *: Mengambil semua kolom dari tabel barang5.
-- FROM barang5: Menentukan tabel yang akan digunakan untuk mengambil data.
-- WHERE discount IS NULL: Mencari baris-baris di mana nilai kolom discount adalah NULL.
select isnull(discount,0) as dsct, 
* from barang5 
where discount is null

/*
Contoh penggunaan ISNULL adalah ketika Anda ingin mengubah nilai NULL menjadi nilai default atau spesifik agar lebih mudah 
diolah atau ditampilkan. Dalam hal ini, nilai NULL dalam kolom discount digantikan dengan nilai 0.
*/