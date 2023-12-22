/*
UNION dan UNION ALL adalah dua perintah dalam SQL Server yang digunakan untuk menggabungkan hasil dari dua atau lebih pernyataan 
SELECT. Meskipun keduanya memiliki tujuan yang mirip, ada perbedaan utama antara keduanya:

1. UNION:

	- UNION digunakan untuk menggabungkan hasil dari dua atau lebih pernyataan SELECT dan secara otomatis menghilangkan duplikat.
	- Setiap bagian dari UNION harus memiliki jumlah kolom yang sama, dan tipe data dari setiap kolom harus sesuai atau dapat 
	diubah secara implisit.
	- Kolom dalam hasil akhir hanya akan menampilkan nilai unik. Jika ada duplikat antara dua set hasil, 
	UNION akan mengambil satu nilai saja.

Contoh:

	SELECT column1, column2 FROM table1
	UNION
	SELECT column1, column2 FROM table2;

2. UNION ALL:

	- UNION ALL juga digunakan untuk menggabungkan hasil dari dua atau lebih pernyataan SELECT, tetapi tidak menghilangkan 
	duplikat.
	- Setiap bagian dari UNION ALL juga harus memiliki jumlah kolom yang sama, dan tipe data dari setiap kolom harus sesuai atau 
	dapat diubah secara implisit.
	- Hasil akhir dari UNION ALL akan mencakup semua baris dari setiap hasil, termasuk duplikat jika ada.

Contoh:

	SELECT column1, column2 FROM table1
	UNION ALL
	SELECT column1, column2 FROM table2;

Penting untuk dicatat bahwa penggunaan UNION dapat lebih memakan waktu dan memori karena melibatkan penghapusan duplikat. 
Jika Anda yakin tidak akan ada duplikat dan ingin meningkatkan kinerja, maka UNION ALL mungkin menjadi pilihan yang lebih baik.
Jika penghapusan duplikat penting, maka UNION harus digunakan.
*/

SELECT * FROM barang6

-- melihat Nama kolom dan tipe data pada table "barang6"
sp_help barang6

-------------------------------------------------------------- UNION ------------------------------------------------------------

/*
Sintaks SQL di bawah ini menggunakan UNION untuk menggabungkan hasil dari dua pernyataan SELECT. Pernyataan pertama mengambil 
kolom barang_name dan category_id dari tabel barang6, sementara pernyataan kedua mengambil kolom category_name dan category_id 
dari tabel barang6_category. UNION akan secara otomatis menghilangkan duplikat dari hasil akhir.

1. SELECT barang_name, category_id FROM barang6:
	Memilih kolom barang_name dan category_id dari tabel barang6.

2. UNION:
	Operator UNION digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan SELECT kedua.

3. SELECT category_name, category_id FROM barang6_category:
	Memilih kolom category_name dan category_id dari tabel barang6_category.

Hasil akhir dari query ini adalah gabungan dari kedua set hasil, di mana duplikat akan dihapus. Kolom-kolom yang dipilih harus 
memiliki tipe data yang sesuai atau dapat diubah secara implisit, dan urutan kolom harus sama. Jika hasil dari kedua pernyataan 
SELECT memiliki urutan kolom yang berbeda, Anda dapat menggunakan alias untuk mengatasi masalah ini.
*/

SELECT 
	barang_name,
	category_id
FROM 
	barang6
UNION 
SELECT 
	category_name,
	category_id
FROM
	barang6_category

------------------------------------------------------------- UNION ALL ---------------------------------------------------------

/*
Sintaks SQL di bawah ini menggunakan UNION dan UNION ALL untuk menggabungkan hasil dari tiga pernyataan SELECT. 
Pernyataan pertama dan kedua mengambil kolom barang_name dan category_id dari tabel barang6 dan barang6_category masing-masing. 
Pernyataan ketiga secara eksplisit menambahkan satu baris baru dengan nilai 'Laptop' dan 1 untuk kolom barang_name dan category_id. 
UNION akan menghilangkan duplikat, sedangkan UNION ALL akan menyertakan semua baris, termasuk duplikat jika ada.

1. SELECT barang_name, category_id FROM barang6:
	Memilih kolom barang_name dan category_id dari tabel barang6.

2. UNION:
	Operator UNION digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan SELECT kedua. 
	UNION secara otomatis menghilangkan duplikat.

3. SELECT category_name, category_id FROM barang6_category:
	Memilih kolom category_name dan category_id dari tabel barang6_category.

4. UNION ALL:
	Operator UNION ALL digunakan untuk menggabungkan hasil dari pernyataan SELECT sebelumnya (yang sudah digabungkan) dengan hasil
	dari pernyataan SELECT ketiga. UNION ALL menyertakan semua baris, termasuk duplikat.

5. SELECT 'Laptop', 1:
	Memilih nilai konstan 'Laptop' untuk kolom barang_name dan nilai konstan 1 untuk kolom category_id. Baris ini secara eksplisit
	ditambahkan ke hasil akhir.

Hasil akhir dari query ini adalah gabungan dari ketiga set hasil. Duplikat akan dihilangkan oleh UNION, tetapi baris dengan nilai
'Laptop' dan 1 akan tetap ada dalam hasil akhir karena penggunaan UNION ALL pada pernyataan ketiga.
*/

SELECT 
	barang_name,
	category_id
FROM 
	barang6
UNION 
SELECT 
	category_name,
	category_id
FROM
	barang6_category
UNION ALL
SELECT 
	'Laptop',
	1