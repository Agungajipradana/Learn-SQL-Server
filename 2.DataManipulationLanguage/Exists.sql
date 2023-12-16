/*
Dalam SQL Server, EXISTS adalah operator yang digunakan untuk memeriksa keberadaan baris dalam hasil subquery. 
EXISTS mengembalikan nilai TRUE jika subquery menghasilkan setidaknya satu baris, dan FALSE jika subquery tidak menghasilkan 
baris sama sekali.

Sintaks umum dari EXISTS adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table1
	WHERE EXISTS (subquery);

Contoh penggunaan EXISTS:

	SELECT customer_id, customer_name
	FROM customers
	WHERE EXISTS (
		SELECT 1
		FROM orders
		WHERE orders.customer_id = customers.customer_id
	);

Pada contoh di atas, query akan mengembalikan semua customer_id dan customer_name dari tabel customers di mana setidaknya ada 
satu pesanan (orders) yang terkait dengan pelanggan tersebut. Subquery di dalam EXISTS hanya mengembalikan nilai 1 jika ada 
setidaknya satu baris yang memenuhi kondisi.

EXISTS biasanya digunakan bersamaan dengan subquery dan klausa WHERE untuk menghasilkan hasil yang diperlukan berdasarkan 
keberadaan data dalam subquery.
*/

SELECT * FROM barang6

--------------------------------------------------------------- IN ---------------------------------------------------------------
/*
Query SQL di bawah menggunakan IN dan subquery untuk memilih semua kolom (*) dari tabel barang6 (A) di mana brand_id 
terdapat dalam hasil subquery yang membandingkan brand_id antara tabel barang6 (A) dan tabel barang6_brand (B). 
Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6 AS A:

	- Menentukan tabel sumber data sebagai barang6 dan memberikan alias A.

2. WHERE brand_id IN (SELECT brand_id ...):

	- Menggunakan klausa IN untuk memfilter baris-baris dari tabel barang6 di mana brand_id terdapat dalam hasil subquery.


3. SELECT brand_id FROM barang6_brand AS B WHERE A.brand_id = B.brand_id:

	- Subquery ini memilih brand_id dari tabel barang6_brand (B) di mana nilai brand_id sama dengan nilai brand_id dari 
	baris saat ini di tabel barang6 (A).

Jadi, hasil query ini akan mengembalikan semua kolom (*) dari tabel barang6 (A) di mana nilai brand_id ada dalam hasil 
subquery yang membandingkan brand_id antara tabel barang6 dan tabel barang6_brand. Ini dapat digunakan untuk mendapatkan 
data dari barang6 yang terkait dengan merek yang ada dalam tabel barang6_brand.
*/
SELECT * 
FROM barang6 AS A
WHERE brand_id IN (
	SELECT brand_id 
	FROM barang6_brand AS B 
	WHERE A.brand_id = B.brand_id
)

-- NOT IN
SELECT * 
FROM barang6 AS A
WHERE brand_id NOT IN (
	SELECT brand_id 
	FROM barang6_brand AS B 
	WHERE A.brand_id = B.brand_id
)

------------------------------------------------------------- EXISTS -------------------------------------------------------------
/*
Query SQL di bawah menggunakan EXISTS dan subquery untuk memilih semua kolom (*) dari tabel barang6 (A) di mana setidaknya 
satu baris dalam subquery memenuhi kondisi bahwa brand_id dari tabel barang6 (A) sama dengan brand_id dari 
tabel barang6_brand (B). Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6 AS A:

	- Menentukan tabel sumber data sebagai barang6 dan memberikan alias A.

2. WHERE EXISTS (SELECT brand_id ...):

	- Menggunakan klausa EXISTS untuk memfilter baris-baris dari tabel barang6 di mana setidaknya satu baris dalam subquery 
	memenuhi kondisi yang diberikan.

3. SELECT brand_id FROM barang6_brand AS B WHERE A.brand_id = B.brand_id:

	- Subquery ini memilih brand_id dari tabel barang6_brand (B) di mana nilai brand_id sama dengan nilai brand_id dari 
	baris saat ini di tabel barang6 (A).

Jadi, hasil query ini akan mengembalikan semua kolom (*) dari tabel barang6 (A) di mana setidaknya satu baris dalam tabel 
barang6_brand memiliki nilai brand_id yang sama dengan nilai brand_id dari baris saat ini di tabel barang6.
*/
SELECT * 
FROM barang6 AS A
WHERE EXISTS (
	SELECT brand_id 
	FROM barang6_brand AS B 
	WHERE A.brand_id = B.brand_id
)

-- NOT EXISTS
SELECT * 
FROM barang6 AS A
WHERE NOT EXISTS (
	SELECT brand_id 
	FROM barang6_brand AS B 
	WHERE A.brand_id = B.brand_id
)

-------------------------------------------------------Perbedaan IN dan EXISTS ---------------------------------------------------

/*
IN dan EXISTS adalah dua operator dalam SQL Server yang digunakan untuk menggabungkan subquery dengan query utama. 
Berikut adalah perbedaan antara keduanya:

1. Operator IN:

	- Digunakan untuk memeriksa apakah nilai tertentu ada di dalam sebuah set nilai atau hasil dari subquery.
	- Biasanya digunakan ketika Anda ingin membandingkan nilai kolom dengan sekumpulan nilai atau hasil subquery.

Contoh:

	SELECT *
	FROM barang6 AS A
	WHERE A.brand_id IN (SELECT brand_id FROM barang6_brand);

Dalam contoh ini, query akan mengembalikan baris-baris dari tabel barang6 di mana nilai brand_id ada dalam hasil subquery.

2. Operator EXISTS:

	- Digunakan untuk memeriksa apakah subquery menghasilkan setidaknya satu baris.
	- Biasanya digunakan ketika Anda ingin memeriksa keberadaan baris yang memenuhi kondisi tertentu dalam subquery.

Contoh:

	SELECT *
	FROM barang6 AS A
	WHERE EXISTS (SELECT 1 FROM barang6_brand AS B WHERE A.brand_id = B.brand_id);

Dalam contoh ini, query akan mengembalikan baris-baris dari tabel barang6 di mana setidaknya satu baris dalam tabel barang6_brand 
memiliki nilai brand_id yang sama dengan nilai brand_id dari baris saat ini di tabel barang6.

3. Perbedaan Utama:

	- Operator IN digunakan untuk membandingkan nilai dengan set nilai atau hasil subquery.

	- Operator EXISTS digunakan untuk memeriksa keberadaan baris yang memenuhi kondisi tertentu dalam subquery.

Pemilihan antara IN dan EXISTS tergantung pada kebutuhan spesifik query dan kondisi yang ingin Anda cek. 
EXISTS sering digunakan dengan subquery terkait (correlated subqueries) di mana subquery merujuk ke kolom dari query utama.
*/
