/*
Pada SQL Server, tidak ada pernyataan khusus yang disebut "DELETE JOIN." Namun, Anda dapat menggunakan pernyataan DELETE bersama 
dengan klausa JOIN untuk menghapus baris-baris dari satu atau lebih tabel berdasarkan kondisi tertentu. Dalam konteks ini, 
biasanya digunakan klausa FROM untuk menentukan tabel yang akan dihapus dan klausa JOIN untuk menentukan hubungan antara 
tabel-tabel tersebut.

Berikut adalah contoh penggunaan DELETE JOIN-style dengan pernyataan DELETE:

	DELETE A
	FROM Table1 AS A
	INNER JOIN Table2 AS B ON A.common_column = B.common_column
	WHERE B.some_condition;

Penjelasan:

	- DELETE A: 
		Menentukan tabel yang akan dihapus dan memberi alias sebagai A.

	- FROM Table1 AS A INNER JOIN Table2 AS B ON A.common_column = B.common_column: 
		Menentukan hubungan antara dua tabel menggunakan INNER JOIN berdasarkan kolom yang sama.

	- WHERE B.some_condition: 
		Menentukan kondisi untuk membatasi baris yang akan dihapus, jika diperlukan.

Dengan menjalankan query ini, baris-baris yang memenuhi kondisi dari tabel A akan dihapus berdasarkan hubungannya dengan tabel B. 
Pastikan untuk berhati-hati saat menggunakan pernyataan DELETE untuk menghindari penghapusan data yang tidak diinginkan. 
Selalu disarankan untuk membuat cadangan data sebelum menjalankan pernyataan DELETE yang bersifat merubah data.
*/

SELECT * FROM barang6

-- Memasukkan data ke dalam table "barang6"
INSERT INTO barang6 (barang_name, total, price, discount, category_id, brand_id) 
VALUES ('Mouse Pad', 10, 100000, null, null, null)

-- Menampilkan data pada tabel "barang6" dimana "barang_id = 22"
SELECT * FROM barang6 WHERE barang_id=22

/*
Query SQL di bawah adalah contoh dari pernyataan DELETE yang digunakan untuk menghapus baris dari tabel barang6 berdasarkan kondisi
tertentu. Mari kita jelaskan setiap bagian dari query tersebut:

	- DELETE FROM barang6: 
		Menentukan tabel yang akan dihapus, dalam hal ini, tabel adalah barang6.

	- WHERE barang_id = 22: 
		Menetapkan kondisi untuk membatasi baris yang akan dihapus. Hanya baris dengan nilai kolom barang_id sama dengan 22 
		yang akan dihapus.

Dengan menjalankan query ini, baris dengan nilai kolom barang_id sama dengan 22 akan dihapus dari tabel barang6. 
Pastikan bahwa kondisi WHERE sesuai dengan kebutuhan Anda untuk memastikan bahwa hanya baris yang diinginkan yang dihapus. 
Sebaiknya, lakukan cadangan data sebelum menjalankan pernyataan DELETE untuk menghindari kehilangan data yang tidak disengaja.
*/
DELETE FROM barang6 WHERE barang_id=22

-- Menampilkan data pada tabel "barang6" dimana "category_id = 9"
SELECT * FROM barang6 WHERE category_id=9

-- Memasukkan data ke dalam table "barang6"
INSERT INTO barang6 (barang_name, total, price, discount, category_id, brand_id) 
VALUES  ('Cable USB', 10, 50000, null, 9, null),
		('Cable Type C', 10, 65000, null, 9, null),
		('Cable Lightning', 10, 75000, null, 9, null)

/*
Query SQL di bawah adalah contoh dari pernyataan DELETE yang menggunakan klausa TOP untuk menghapus jumlah baris tertentu dari 
tabel barang6 berdasarkan kondisi tertentu. Mari kita jelaskan setiap bagian dari query tersebut:

	- DELETE TOP (1) FROM barang6: 
		Menentukan tabel yang akan dihapus, yaitu barang6, dan menggunakan klausa TOP (1) untuk menghapus hanya satu baris 
		dari tabel.

	- WHERE category_id = 9: 
		Menetapkan kondisi untuk membatasi baris yang akan dihapus. Hanya baris dengan nilai kolom category_id sama dengan 9 
		yang akan dihapus.

Dengan menjalankan query ini, satu baris pertama yang memenuhi kondisi akan dihapus dari tabel barang6. Pastikan bahwa kondisi 
WHERE sesuai dengan kebutuhan Anda untuk memastikan bahwa hanya baris yang diinginkan yang dihapus. Sebaiknya, lakukan cadangan 
data sebelum menjalankan pernyataan DELETE untuk menghindari kehilangan data yang tidak disengaja.
*/
DELETE TOP (1) FROM barang6 WHERE category_id=9

/*
Query SQL di bawah adalah contoh dari pernyataan SELECT yang menggunakan klausa INNER JOIN untuk menggabungkan dua tabel 
(barang6 dan barang6_brand) berdasarkan kondisi tertentu dan memilih data yang memenuhi kondisi tersebut. 

Dengan menjalankan query ini, Anda akan mendapatkan hasil yang terdiri dari semua kolom dari kedua tabel yang memenuhi kondisi 
yang ditetapkan, yaitu baris-baris yang terkait dengan "brand_name = 'Logitech'". 
*/
SELECT * FROM barang6 AS A
INNER JOIN barang6_brand AS B ON A.brand_id = B.brand_id
WHERE brand_name = 'Logitech'

/*
-- Delete Join

Query SQL di bawah adalah contoh dari pernyataan DELETE yang menggunakan klausa INNER JOIN untuk menghapus baris dari tabel 
barang6 berdasarkan kondisi pada tabel lain (barang6_brand). Mari kita jelaskan setiap bagian dari query tersebut:

	- DELETE A: 
		Menentukan tabel yang akan dihapus, yaitu barang6, dan memberi alias sebagai A.

	- FROM barang6 AS A INNER JOIN barang6_brand AS B ON A.brand_id = B.brand_id: 
		Menggunakan INNER JOIN untuk menggabungkan tabel barang6 (diberi alias A) dan barang6_brand (diberi alias B) berdasarkan 
		kunci hubung yang sesuai, yaitu brand_id.

	- WHERE brand_name = 'Logitech': 
		Menetapkan kondisi untuk membatasi baris yang akan dihapus. Hanya baris-baris di mana nilai kolom brand_name di tabel 
		barang6_brand adalah 'Logitech' yang akan dihapus dari tabel barang6.

Dengan menjalankan query ini, baris-baris dari tabel barang6 yang memiliki hubungan dengan merek 'Logitech' pada tabel 
barang6_brand akan dihapus. Pastikan bahwa kondisi WHERE sesuai dengan kebutuhan Anda untuk memastikan bahwa hanya baris yang 
diinginkan yang dihapus. Sebaiknya, lakukan cadangan data sebelum menjalankan pernyataan DELETE untuk menghindari kehilangan 
data yang tidak disengaja.
*/
DELETE A 
FROM barang6 AS A
INNER JOIN barang6_brand AS B ON A.brand_id = B.brand_id
WHERE brand_name = 'Logitech'