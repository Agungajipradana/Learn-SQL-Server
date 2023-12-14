/*
GROUPING SETS adalah klausa yang digunakan dalam SQL untuk melakukan operasi pengelompokan (grouping) pada beberapa 
set kolom secara bersamaan. Dengan menggunakan GROUPING SETS, Anda dapat menggambarkan beberapa tingkatan pengelompokan 
dalam satu query, sehingga Anda mendapatkan hasil agregat untuk kombinasi tertentu dari kolom.

Contoh penggunaan GROUPING SETS adalah sebagai berikut:

	SELECT 
		column1,
		column2,
		SUM(sales) AS total_sales
	FROM sales
	GROUP BY GROUPING SETS (
		(column1, column2),
		(column1),
		(column2),
		()
	);

Dalam contoh ini, GROUPING SETS digunakan untuk menghitung total penjualan (total_sales) berdasarkan kombinasi dari 
column1 dan column2. Hasilnya akan mencakup total penjualan untuk setiap kombinasi column1 dan column2, total penjualan untuk 
setiap nilai unik column1, total penjualan untuk setiap nilai unik column2, dan total penjualan keseluruhan.

Dengan GROUPING SETS, Anda dapat melakukan pengelompokan yang fleksibel dan menyediakan hasil agregat yang lebih rinci untuk 
kombinasi kolom tertentu tanpa perlu menjalankan beberapa query terpisah.

Cara penggunaan GROUPING SETS dapat bervariasi tergantung pada kebutuhan pengelompokan Anda, dan Anda dapat menentukan beberapa 
set kolom yang ingin Anda lihat dalam hasil akhir.
*/

select * from barang6
select * from barang6_category
select * from barang6_brand

-- Melakukan Grouping dengan cara manual menggunakan klausa UNION ALL
/*
Query SQL di bawah ini menggabungkan hasil agregat dari tabel barang6 berdasarkan brand_name dan category_name menggunakan 
klausa UNION ALL. Pada setiap bagian dari UNION ALL, hasil dikelompokkan dan dijumlahkan untuk setiap kombinasi dari 
brand_name dan category_name. Juga, setiap bagian mencakup kondisi di mana satu atau kedua kolom tersebut memiliki nilai NULL.

-- Menggabungkan hasil agregat dari tabel barang6 berdasarkan brand_name dan category_name
-- dengan menambahkan kondisi NULL pada brand_name dan category_name
*/

-- Bagian pertama
SELECT 
    C.brand_name,
    B.category_name,
    SUM(A.price) AS total
FROM 
    barang6 AS A
    INNER JOIN barang6_category AS B ON A.category_id = B.category_id
    INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id
GROUP BY 
    C.brand_name, B.category_name

UNION ALL

-- Bagian kedua
SELECT 
    NULL,
    B.category_name,
    SUM(A.price) AS total
FROM 
    barang6 AS A
    INNER JOIN barang6_category AS B ON A.category_id = B.category_id
    INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id
GROUP BY 
    B.category_name

UNION ALL

-- Bagian ketiga
SELECT 
    C.brand_name,
    NULL,
    SUM(A.price) AS total
FROM 
    barang6 AS A
    INNER JOIN barang6_category AS B ON A.category_id = B.category_id
    INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id
GROUP BY 
    C.brand_name

UNION ALL

-- Bagian keempat
SELECT 
    NULL,
    NULL,
    SUM(A.price) AS total
FROM 
    barang6 AS A
    INNER JOIN barang6_category AS B ON A.category_id = B.category_id
    INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id

-- Mengurutkan hasil secara ascending berdasarkan brand_name dan category_name
ORDER BY 
    C.brand_name, B.category_name ASC;

--------------------------------------------------------- GROUPING SETS ----------------------------------------------------------

-- Melakukan Grouping dengan "GROUPING SETS"
/*
1. SELECT: Menentukan kolom atau hasil perhitungan yang ingin ditampilkan dalam hasil query.
	
	- C.brand_name, B.category_name: 
		Kolom yang akan ditampilkan dalam hasil akhir.

	- SUM(A.price) AS total: 
		Menghitung jumlah total dari kolom price dalam setiap kelompok.

2. FROM: Menentukan tabel atau sumber data yang digunakan dalam query, dalam hal ini tabel barang6.

3. INNER JOIN: Menggabungkan tabel barang6, barang6_category, dan barang6_brand berdasarkan kriteria tertentu.

4. GROUP BY GROUPING SETS: Digunakan untuk menentukan tingkatan pengelompokan. Dalam hal ini, kita mengelompokkan 
	berdasarkan kombinasi (C.brand_name, B.category_name), C.brand_name, B.category_name, dan () (tanpa pengelompokan).

5. ORDER BY: Mengurutkan hasil secara ascending berdasarkan brand_name dan category_name.

Dengan menggunakan GROUP BY GROUPING SETS, Anda dapat dengan fleksibel menentukan level pengelompokan yang berbeda dan 
mendapatkan hasil agregat untuk setiap tingkatan yang diinginkan.
*/
SELECT 
    C.brand_name,
    B.category_name,
    SUM(A.price) AS total
FROM 
    barang6 AS A
    INNER JOIN barang6_category AS B ON A.category_id = B.category_id
    INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id
GROUP BY 
	GROUPING SETS(
		(C.brand_name, B.category_name),
		(C.brand_name),
		(B.category_name),
		()
	)
ORDER BY 
	C.brand_name, B.category_name asc
    