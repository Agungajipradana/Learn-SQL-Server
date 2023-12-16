/*
Dalam SQL Server, ALL adalah bagian dari klausa WHERE yang digunakan untuk membandingkan sebuah ekspresi dengan semua nilai 
yang dihasilkan oleh subquery. Kondisi yang diberikan oleh ALL akan benar (TRUE) hanya jika kondisi tersebut memenuhi semua 
nilai yang dihasilkan oleh subquery.

Sintaks umum dari penggunaan ALL adalah sebagai berikut:

	SELECT column1, column2, ...
	FROM table
	WHERE expression operator ALL (subquery);

Contoh penggunaan ALL:

	SELECT *
	FROM orders
	WHERE total_amount > ALL (
		SELECT total_amount
		FROM previous_orders
		WHERE customer_id = 123
	);

Pada contoh di atas, query akan mengembalikan semua baris dari tabel orders di mana total_amount lebih besar dari semua 
nilai total_amount yang dihasilkan oleh subquery.

ALL biasanya digunakan bersama dengan operator perbandingan seperti >, <, >=, <=, =, atau <>. 
Kondisi yang diberikan oleh ALL akan diterapkan pada setiap baris hasil subquery, dan klausa WHERE akan mengembalikan 
hasil yang benar hanya jika kondisi tersebut memenuhi semua nilai subquery.
*/

SELECT * FROM barang6

/*
Query SQL di bawah menggunakan ALL untuk membandingkan nilai category_id dari tabel barang6 dengan semua nilai category_id 
yang dihasilkan oleh subquery. Subquery ini mengambil nilai category_id dari tabel barang6_category yang memiliki nilai 
category_id sama dengan 2. Hasil query akan mengembalikan baris-baris dari tabel barang6 di mana category_id kurang dari 
semua nilai category_id yang dihasilkan oleh subquery. Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6:

	- Menentukan tabel sumber data sebagai barang6 dan memilih semua kolom (*) dari tabel tersebut.

2. WHERE category_id < ALL(SELECT category_id ...):

	- Menggunakan klausa WHERE untuk memfilter baris-baris dari tabel barang6 di mana nilai category_id kurang dari semua 
	nilai category_id yang dihasilkan oleh subquery.

3. SELECT category_id FROM barang6_category WHERE category_id = 2:

	- Subquery ini mengambil nilai category_id dari tabel barang6_category yang memiliki nilai category_id sama dengan 2.

4. ALL(...):

	- Operator ALL membandingkan nilai category_id dari tabel barang6 dengan semua nilai category_id yang dihasilkan oleh subquery.
	
	- Baris akan dimasukkan ke dalam hasil query hanya jika nilai category_id dari baris saat ini kurang dari semua nilai 
	category_id yang dihasilkan oleh subquery.
*/
SELECT *
FROM barang6
WHERE category_id < ALL (
	SELECT category_id
	FROM barang6_category
	WHERE category_id = 2
);


/*
Query SQL di bawah menggunakan ALL untuk membandingkan nilai category_id dari tabel barang6 (A) dengan semua nilai category_id 
yang dihasilkan oleh subquery yang mengambil nilai dari tabel barang6_category (B). Subquery ini memastikan bahwa nilai 
category_id dari tabel barang6 (A) sama dengan semua nilai category_id yang ada dalam tabel barang6_category (B). 
Kondisi ini sering kali akan menghasilkan hasil yang sama seperti mengambil semua baris dari tabel barang6 tanpa subquery. 
Berikut adalah penjelasan sintaksnya:

1. SELECT * FROM barang6 AS A:

	- Menentukan tabel sumber data sebagai barang6 dan memberikan alias A. Memilih semua kolom (*) dari tabel tersebut.

2. WHERE A.category_id = ALL(SELECT B.category_id ...):

	- Menggunakan klausa WHERE untuk memfilter baris-baris dari tabel barang6 (A) di mana nilai category_id sama dengan 
	semua nilai category_id yang dihasilkan oleh subquery.

3. SELECT B.category_id FROM barang6_category AS B WHERE A.category_id = B.category_id:

	- Subquery ini mengambil nilai category_id dari tabel barang6_category (B) di mana nilai category_id sama dengan 
	nilai category_id dari baris saat ini di tabel barang6 (A).

4. ALL(...):

	- Operator ALL membandingkan nilai category_id dari tabel barang6 (A) dengan semua nilai category_id yang dihasilkan 
	oleh subquery.
	
	- Karena subquery hanya menghasilkan nilai yang sesuai dengan kondisi A.category_id = B.category_id, dan ALL 
	memerlukan bahwa kondisi tersebut harus benar untuk semua nilai subquery, hasilnya sering kali sama dengan mengambil 
	semua baris dari tabel barang6.

Jadi, query ini sering kali akan mengembalikan hasil yang sama seperti query tanpa subquery, kecuali jika ada kasus khusus 
di mana nilai category_id di tabel barang6 harus cocok dengan semua nilai yang dihasilkan oleh subquery.
*/
SELECT  * 
FROM barang6 AS A
WHERE A.category_id = ALL(
	SELECT B.category_id
	FROM barang6_category AS B
	WHERE A.category_id = B.category_id
)