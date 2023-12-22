/*
INTERSECT adalah salah satu operator set di SQL Server yang digunakan untuk mengambil nilai yang sama dari dua set hasil yang 
berbeda. Dengan kata lain, INTERSECT mengembalikan nilai-nilai yang ada di kedua set hasil. Operator ini mirip dengan AND dalam 
operasi logika, tetapi bekerja pada tingkat baris atau set hasil.

Sintaks dari INTERSECT adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table1
	INTERSECT
	SELECT column1, column2, ...
	FROM table2;

Contoh penggunaan INTERSECT:

	SELECT barang_name, category_id
	FROM barang6
	INTERSECT
	SELECT category_name, category_id
	FROM barang6_category;

Dalam contoh di atas, INTERSECT digunakan untuk mengembalikan nilai-nilai yang sama dari kolom category_id antara tabel barang6 
dan barang6_category. Hasilnya adalah set dari nilai-nilai category_id yang ada di kedua tabel.

Beberapa hal yang perlu diperhatikan tentang INTERSECT:

	- Kedua set hasil harus memiliki jumlah dan tipe kolom yang sama.
	- INTERSECT secara otomatis menghilangkan duplikat.
	- Hasil INTERSECT akan berisi nilai-nilai yang ada di kedua set hasil.

Penting untuk dicatat bahwa INTERSECT tidak umum digunakan dibandingkan dengan UNION atau JOIN, tetapi dapat menjadi berguna 
ketika Anda ingin mengetahui nilai-nilai yang sama antara dua set hasil.
*/

SELECT * FROM barang6
SELECT * FROM barang6_product

-- membuat table "barang6_product"
CREATE TABLE barang6_product (
	barang_id	INT IDENTITY PRIMARY KEY,
	barang_name VARCHAR(50),
	total		INT,
	price		MONEY,
	discount	MONEY,
	category_id INT,
	brand_id	INT
)

-- memasukkan data ke table "barang6_product"
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('Laptop Acer Aspire 5', 10, 10000000, 1500000, 1, 1)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('Laptop Asus ROG Strix', 5, 20000000, 2500000, 1, 2)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('Laptop Macbook M1', 6, 15000000, 2500000, 1, 3)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('HP Android Samsung S21', 10, 20000000, 3000000, 2, 4)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('HP Android Xiaomi 10', 5, 7000000, 500000, 2, 5)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('HP Iphone 14', 5, 14000000, 2000000, 2, 3)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('HP Iphone 13', 5, 12000000, 1500000, 2, 3)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('AC Samsung 2 PK', 10, 6500000, 1000000, 3, 4)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('AC Sharp 1 PK', 4, 4500000, 500000, 3, 6)
INSERT INTO barang6_product (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('Camera Canon DSLR', 7, 8000000, 800000, 4, 7)


/*
Syntax SQL di bawah ini menggunakan operator INTERSECT untuk mengambil nilai-nilai yang sama dari dua set hasil, 
yaitu tabel barang6 dan barang6_product. Operator INTERSECT akan menghasilkan set hasil yang berisi baris-baris yang identik 
dari kedua tabel.

1. SELECT * FROM barang6:
	Memilih semua kolom (*) dari tabel barang6.

2. INTERSECT:
	Operator INTERSECT digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan 
	SELECT kedua.

3. SELECT * FROM barang6_product:
	Memilih semua kolom (*) dari tabel barang6_product.

Hasil akhir dari query ini adalah set hasil yang berisi semua baris yang identik (nilai yang sama) dari tabel barang6 dan 
barang6_product. Kolom-kolom dalam set hasil akan sesuai dengan kolom-kolom yang ada di kedua tabel dan hasilnya akan otomatis 
menghilangkan duplikat.
*/
SELECT * FROM barang6
INTERSECT
SELECT * FROM barang6_product

/*
Syntax SQL di bawah ini menggunakan operator INTERSECT untuk mengambil nilai-nilai yang sama dari dua set hasil, 
yaitu kolom barang_name dan category_id antara tabel barang6 dan barang6_product. Operator INTERSECT akan menghasilkan set 
hasil yang berisi baris-baris yang identik dari kedua tabel.

1. SELECT barang_name, category_id FROM barang6:
	Memilih kolom barang_name dan category_id dari tabel barang6.

2. INTERSECT:
	Operator INTERSECT digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan 
	SELECT kedua.

3. SELECT barang_name, category_id FROM barang6_product:
	Memilih kolom barang_name dan category_id dari tabel barang6_product.

Hasil akhir dari query ini adalah set hasil yang berisi semua baris yang identik (nilai yang sama) dari kolom barang_name dan 
category_id antara tabel barang6 dan barang6_product. Kolom-kolom dalam set hasil akan sesuai dengan kolom-kolom yang ada di 
kedua tabel dan hasilnya akan otomatis menghilangkan duplikat.
*/
SELECT 
	barang_name,
	category_id
FROM 
	barang6
INTERSECT
SELECT 
	barang_name,
	category_id
FROM 
	barang6_product

/*
Syntax SQL di bawah ini menggunakan operator INTERSECT untuk mengambil nilai-nilai yang sama dari dua set hasil pertama, 
yaitu kolom barang_name dan category_id antara tabel barang6 dan barang6_product. Kemudian, operator INTERSECT digunakan lagi 
untuk menggabungkan hasil tersebut dengan set hasil dari pernyataan SELECT 'Laptop Acer Aspire 5', 1.

1. SELECT barang_name, category_id FROM barang6:
	Memilih kolom barang_name dan category_id dari tabel barang6.

2. INTERSECT:
	Operator INTERSECT digunakan untuk menggabungkan hasil dari pernyataan SELECT pertama dengan hasil dari pernyataan 
	SELECT kedua.

3. SELECT barang_name, category_id FROM barang6_product:
	Memilih kolom barang_name dan category_id dari tabel barang6_product.

4. INTERSECT:
	Operator INTERSECT digunakan kembali untuk menggabungkan hasil sebelumnya dengan set hasil dari pernyataan 
	SELECT 'Laptop Acer Aspire 5', 1.

5. SELECT 'Laptop Acer Aspire 5', 1:
	Memilih nilai konstan 'Laptop Acer Aspire 5' untuk kolom barang_name dan nilai konstan 1 untuk kolom category_id.

Hasil akhir dari query ini adalah set hasil yang berisi semua baris yang identik (nilai yang sama) dari kolom barang_name dan 
category_id antara tabel barang6, barang6_product, dan nilai konstan yang dipilih. Operator INTERSECT secara otomatis 
menghilangkan duplikat dari hasil akhir.
*/
SELECT 
	barang_name,
	category_id
FROM 
	barang6
INTERSECT
SELECT 
	barang_name,
	category_id
FROM 
	barang6_product
INTERSECT
SELECT
	'Laptop Acer Aspire 5',
	1