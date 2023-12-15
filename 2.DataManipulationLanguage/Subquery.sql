/*
Subquery, juga dikenal sebagai subselect atau inner query, adalah query yang disisipkan (embedded) di dalam query utama. 
Subquery digunakan untuk mendapatkan data yang akan digunakan dalam kondisi atau perbandingan dalam query utama. 
Subquery dapat berada dalam klausa WHERE, FROM, atau SELECT dalam query utama.

Berikut adalah contoh-contoh subquery:

1. Subquery dalam Klausa WHERE:

	SELECT column1, column2
	FROM table1
	WHERE column3 = (SELECT column4 FROM table2 WHERE condition);

2. Subquery dalam Klausa FROM:

	SELECT column1, AVG(column2) AS avg_value
	FROM (SELECT * FROM table1 WHERE condition) AS subquery
	GROUP BY column1;

3. Subquery dalam Klausa SELECT:

	SELECT column1, (SELECT MAX(column2) FROM table2) AS max_value
	FROM table1;

Subquery dapat mengembalikan satu nilai atau satu set hasil, dan ini tergantung pada kebutuhan query utama. 
Subquery dapat digunakan di berbagai tempat dalam SQL untuk menyederhanakan logika dan membuat query lebih mudah dibaca. 
Subquery juga dapat digunakan untuk membuat query yang lebih dinamis dan fleksibel.
*/

SELECT * FROM barang6

/*
Query SQL di bawah adalah contoh penggunaan subquery dalam klausa WHERE untuk mengambil data dari tabel barang6 yang memiliki 
nilai category_id yang sesuai dengan nilai category_id yang ada dalam tabel barang6_category.

Berikut adalah penjelasan sintaksnya:

1. Query Utama (SELECT * FROM barang6):

	- SELECT *: Memilih semua kolom dari tabel barang6.
	- FROM barang6: Menentukan tabel sumber data, dalam hal ini, tabel yang disebut barang6.

2. Klausa WHERE:

	- WHERE category_id IN (SELECT category_id FROM barang6_category): Menggunakan subquery untuk memfilter baris-baris dari 
	tabel barang6 di mana nilai category_id terdapat dalam hasil subquery. Subquery tersebut mengambil semua nilai category_id 
	dari tabel barang6_category.

Dengan menggunakan subquery dalam klausa WHERE dengan operator IN, query ini akan mengembalikan semua baris dari tabel barang6 
di mana category_id cocok dengan setiap category_id yang ada dalam tabel barang6_category. Ini memungkinkan Anda mengambil data 
dari satu tabel berdasarkan nilai-nilai yang sesuai dengan data di tabel lain.
*/
SELECT * 
FROM 
	barang6
WHERE 
	category_id IN (
		SELECT category_id 
		FROM barang6_category
	)


/*
1. SELECT barang_name, total, price, ...:

	- Memilih kolom barang_name, total, dan price dari tabel barang6.

2. (SELECT brand_name ...):

	- Subquery yang mengambil brand_name dari tabel barang6_brand berdasarkan brand_id yang sesuai dengan brand_id dari baris 
	saat ini di tabel barang6.

3. FROM barang6:

	- Menentukan tabel sumber data sebagai barang6.

4. WHERE category_id IN (SELECT category_id ...):

	- Memfilter baris-baris dari tabel barang6 di mana category_id terdapat dalam hasil subquery.
	- Subquery ini mengambil category_id dari tabel barang6_category yang memiliki nama kategori (category_name) yang 
	mengandung substring 'er'.

Jadi, hasil query ini akan menampilkan barang_name, total, price, dan Brand Name (nama merek) untuk barang-barang yang memiliki 
category_id sesuai dengan kategori yang mengandung substring 'er'. Subquery digunakan untuk mengambil nama merek (brand_name) 
dari tabel barang6_brand yang sesuai dengan brand_id di dalam tabel barang6.
*/
SELECT 
	barang_name, 
	total, 
	price, 
	(SELECT brand_name 
	 FROM barang6_brand 
	 WHERE brand_id = barang6.brand_id) AS 'Brand Name'
FROM 
	barang6 
WHERE 
	category_id IN (
		SELECT category_id 
		FROM barang6_category
		WHERE category_name LIKE '%er'
	)


/*
Query SQL di dibawah adalah contoh penggunaan subquery dalam klausa FROM untuk membuat tabel turunan (derived table) yang 
disebut tbl1. Subquery ini melakukan penggabungan (JOIN) antara tabel barang6, barang6_category, dan barang6_brand, dan 
kemudian menghasilkan tabel turunan yang digunakan dalam SELECT utama.

1. SELECT tbl1.barang_name, tbl1.price, tbl1.category_name, tbl1.brand_name:
	
	- Memilih kolom-kolom dari tabel turunan (tbl1).

2. FROM (SELECT ...):

	- Mendefinisikan tabel turunan (tbl1) menggunakan subquery di dalam klausa FROM.
	- Subquery ini mengambil kolom-kolom barang_name, price, category_name, dan brand_name dari tabel barang6 dan melakukan 
	INNER JOIN dengan tabel barang6_category dan barang6_brand berdasarkan kriteria tertentu.

3. AS tbl1:

	- Memberikan alias tbl1 pada tabel turunan hasil subquery untuk memudahkan referensi di dalam query utama.

Hasil query ini adalah menampilkan kolom-kolom yang dipilih dari tabel turunan tbl1, yang diperoleh dari hasil INNER JOIN 
antara tabel barang6, barang6_category, dan barang6_brand. Tabel turunan ini berguna ketika Anda perlu melakukan operasi 
SELECT lebih lanjut atau melakukan JOIN dengan tabel lain di dalam query utama.
*/
SELECT 
	tbl1.barang_name,
	tbl1.price,
	tbl1.category_name,
	tbl1.brand_name
FROM
	(SELECT 
		barang_name,
		price,
		category_name,
		brand_name
	FROM 
		barang6 as A
		INNER JOIN barang6_category AS B ON A.category_id = B.category_id
		INNER JOIN barang6_brand AS C ON A.brand_id = C.brand_id
	) AS tbl1

