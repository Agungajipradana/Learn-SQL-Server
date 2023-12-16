/*
Dalam SQL Server, ANY adalah bagian dari klausa WHERE yang dapat digunakan untuk membandingkan nilai dengan setiap nilai yang 
dihasilkan oleh subquery. Klausa ini memberikan hasil yang benar (TRUE) jika kondisi yang ditentukan terpenuhi untuk setidaknya 
satu baris dalam hasil subquery.

Sintaks umum dari penggunaan ANY adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table
	WHERE expression operator ANY (subquery);

Contoh penggunaan ANY:

	SELECT *
	FROM orders
	WHERE total_amount > ANY (
		SELECT total_amount
		FROM previous_orders
		WHERE customer_id = 123
	);

Pada contoh di atas, query tersebut akan mengembalikan semua baris dari tabel 
orders di mana total_amount lebih besar dari setidaknya satu nilai total_amount yang dihasilkan oleh subquery.

ANY dapat digunakan bersama dengan operator perbandingan seperti >, <, >=, <=, =, atau <>. Kondisi yang diberikan oleh ANY 
akan diterapkan pada setiap baris hasil subquery, dan jika setidaknya satu baris memenuhi kondisi tersebut, 
klausa WHERE akan mengembalikan hasil yang benar.
*/

SELECT * FROM barang6

/*
Query SQL di bawah menggunakan ANY untuk membandingkan nilai category_id dari tabel barang6 dengan setiap nilai category_id 
yang dihasilkan oleh subquery yang mengambil nilai dari tabel barang6_category. Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6:

	- Menentukan tabel sumber data sebagai barang6 dan memilih semua kolom (*) dari tabel tersebut.

2. WHERE category_id = ANY(SELECT category_id ...):

	- Menggunakan klausa WHERE untuk memfilter baris-baris dari tabel barang6 di mana nilai category_id sama dengan setidaknya 
	satu nilai category_id yang dihasilkan oleh subquery.

3. SELECT category_id FROM barang6_category:

	- Subquery ini mengambil semua nilai category_id dari tabel barang6_category.

4. ANY(...):

	- Operator ANY membandingkan nilai category_id dari tabel barang6 dengan setiap nilai category_id yang 
	dihasilkan oleh subquery.

	- Jika setidaknya satu nilai category_id dari subquery cocok dengan nilai category_id dari baris saat ini di tabel barang6, 
	maka baris tersebut akan dimasukkan ke dalam hasil query.

Jadi, query ini akan mengembalikan semua baris dari tabel barang6 di mana category_id sama dengan setidaknya satu nilai 
category_id yang ada dalam tabel barang6_category.
*/
SELECT * 
FROM barang6
WHERE category_id = ANY(
	SELECT category_id
	FROM barang6_category
)


/*
Query SQL di bawah menggunakan ANY untuk membandingkan nilai category_id dari tabel barang6 dengan setiap nilai category_id 
yang dihasilkan oleh subquery. Subquery ini membatasi hasilnya hanya pada nilai category_id yang berada dalam kumpulan 
(set) (4, 5). Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6:

	- Menentukan tabel sumber data sebagai barang6 dan memilih semua kolom (*) dari tabel tersebut.

2. WHERE category_id = ANY(SELECT category_id ...):

	- Menggunakan klausa WHERE untuk memfilter baris-baris dari tabel barang6 di mana nilai category_id sama dengan setidaknya 
	satu nilai category_id yang dihasilkan oleh subquery.

3. SELECT category_id FROM barang6_category WHERE category_id IN (4, 5):

	- Subquery ini mengambil semua nilai category_id dari tabel barang6_category yang berada dalam kumpulan (4, 5).

4. ANY(...):

	- Operator ANY membandingkan nilai category_id dari tabel barang6 dengan setiap nilai category_id yang dihasilkan 
	oleh subquery yang telah difilter dengan kondisi IN (4, 5).

	- Jika setidaknya satu nilai category_id dari subquery cocok dengan nilai category_id dari baris saat ini di tabel barang6, 
	maka baris tersebut akan dimasukkan ke dalam hasil query.

Jadi, query ini akan mengembalikan semua baris dari tabel barang6 di mana category_id sama dengan setidaknya satu nilai 
category_id yang berada dalam kumpulan (4, 5) dalam tabel barang6_category.
*/
SELECT * 
FROM barang6
WHERE category_id = ANY(
	SELECT category_id
	FROM barang6_category
	WHERE category_id IN (4,5)
)


/*
Query SQL di bawah menggunakan ANY untuk membandingkan nilai category_id dari tabel barang6 (A) dengan setiap nilai category_id 
yang dihasilkan oleh subquery yang mengambil nilai dari tabel barang6_category (B). Subquery ini membatasi hasilnya hanya pada 
nilai category_id yang berada dalam kumpulan (set) (4, 5) dan memastikan bahwa category_id dari tabel barang6 (A) sama 
dengan category_id dari tabel barang6_category (B). Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6 AS A:

	- Menentukan tabel sumber data sebagai barang6 dan memberikan alias A. Memilih semua kolom (*) dari tabel tersebut.

2. WHERE A.category_id = ANY(SELECT B.category_id ...):

	- Menggunakan klausa WHERE untuk memfilter baris-baris dari tabel barang6 (A) di mana nilai category_id sama dengan 
	setidaknya satu nilai category_id yang dihasilkan oleh subquery.

3. SELECT B.category_id FROM barang6_category AS B WHERE B.category_id IN (4, 5) AND A.category_id = B.category_id:

	- Subquery ini mengambil nilai category_id dari tabel barang6_category (B) yang berada dalam kumpulan (4, 5) dan 
	memastikan bahwa category_id dari tabel barang6 (A) sama dengan category_id dari tabel barang6_category (B).

4. ANY(...):

	- Operator ANY membandingkan nilai category_id dari tabel barang6 (A) dengan setiap nilai category_id yang dihasilkan oleh 
	subquery yang telah difilter dengan kondisi IN (4, 5) dan A.category_id = B.category_id.

	- Jika setidaknya satu nilai category_id dari subquery cocok dengan nilai category_id dari baris saat ini di tabel barang6 (A), 
	maka baris tersebut akan dimasukkan ke dalam hasil query.

Jadi, query ini akan mengembalikan semua baris dari tabel barang6 (A) di mana category_id sama dengan setidaknya satu nilai 
category_id yang berada dalam kumpulan (4, 5) dalam tabel barang6_category (B).
*/
SELECT * 
FROM barang6 AS A
WHERE A.category_id = ANY(
	SELECT B.category_id 
	FROM barang6_category AS B
	WHERE B.category_id IN (4,5)
	AND A.category_id = B.category_id
)