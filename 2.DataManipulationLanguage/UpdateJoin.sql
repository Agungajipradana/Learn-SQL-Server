/*
Di SQL Server, pernyataan UPDATE dapat digunakan bersama dengan JOIN untuk memperbarui nilai-nilai di satu tabel berdasarkan data 
dari tabel lain. Pernyataan ini dikenal sebagai "UPDATE JOIN". 
Dengan menggunakan JOIN, Anda dapat membuat hubungan antara dua atau lebih tabel berdasarkan kolom-kolom tertentu dan 
memperbarui nilai-nilai sesuai dengan kondisi tertentu.

Berikut adalah contoh sederhana dari penggunaan UPDATE JOIN:

Di SQL Server, pernyataan UPDATE dapat digunakan bersama dengan JOIN untuk memperbarui nilai-nilai di satu tabel berdasarkan data 
dari tabel lain. Pernyataan ini dikenal sebagai "UPDATE JOIN". 
Dengan menggunakan JOIN, Anda dapat membuat hubungan antara dua atau lebih tabel berdasarkan kolom-kolom tertentu dan memperbarui 
nilai-nilai sesuai dengan kondisi tertentu.

Berikut adalah contoh sederhana dari penggunaan UPDATE JOIN:

	UPDATE A
	SET A.column1 = B.new_value
	FROM Table1 AS A
	INNER JOIN Table2 AS B ON A.common_column = B.common_column
	WHERE B.some_condition;

Penjelasan:

	- UPDATE A: Menentukan tabel yang akan diperbarui dan memberi alias sebagai A.
	- SET A.column1 = B.new_value: Menetapkan nilai kolom column1 di tabel A dengan nilai baru dari kolom new_value di tabel B.
	- FROM Table1 AS A INNER JOIN Table2 AS B ON A.common_column = B.common_column: Menentukan hubungan antara dua tabel 
	menggunakan INNER JOIN berdasarkan kolom yang sama.
	- WHERE B.some_condition: Menetapkan kondisi untuk membatasi baris yang akan diperbarui, jika diperlukan.

Perlu diingat bahwa pembaruan dapat memiliki dampak yang signifikan pada data, oleh karena itu, selalu disarankan untuk membuat 
cadangan data sebelum menjalankan pernyataan UPDATE yang potensial memengaruhi banyak baris.
*/

SELECT * FROM barang6

SELECT TOP 5 * 
FROM barang6

/*
- Update Single Column

Query SQL di bawah adalah contoh dari pernyataan UPDATE yang digunakan untuk memperbarui nilai kolom total pada tabel barang6 
di mana nilai kolom barang_id sama dengan 3. Mari kita jelaskan setiap bagian dari query tersebut:

	- UPDATE barang6: Menentukan tabel yang akan diperbarui, dalam hal ini, tabel adalah barang6.

	- SET total = 11: Menetapkan nilai kolom total menjadi 11. Ini adalah nilai baru yang akan diberikan kepada kolom tersebut.

	- WHERE barang_id = 3: Menentukan kondisi di mana pembaruan akan diterapkan. Hanya baris dengan nilai kolom barang_id sama 
	dengan 3 yang akan diperbarui.

Dengan menjalankan query ini, nilai kolom total pada baris dengan barang_id 3 dalam tabel barang6 akan diubah menjadi 11. 
Pastikan bahwa kondisi WHERE sesuai dengan kebutuhan Anda untuk memastikan pembaruan hanya diterapkan pada baris yang diinginkan.
*/
UPDATE barang6
SET total=11
WHERE barang_id=3

/*
-- Update Multiple Column

Query SQL di bawah adalah contoh dari pernyataan UPDATE yang digunakan untuk memperbarui nilai beberapa kolom pada tabel barang6 
di mana nilai kolom barang_id sama dengan 3. Mari kita jelaskan setiap bagian dari query tersebut:

	- UPDATE barang6: Menentukan tabel yang akan diperbarui, dalam hal ini, tabel adalah barang6.

	- SET total = 11, discount = 2000000: Menetapkan nilai beberapa kolom. Dalam hal ini, kolom total akan diubah menjadi 11, 
	dan kolom discount akan diubah menjadi 2000000.

	- WHERE barang_id = 3: Menentukan kondisi di mana pembaruan akan diterapkan. Hanya baris dengan nilai kolom barang_id sama 
	dengan 3 yang akan diperbarui.

Dengan menjalankan query ini, nilai kolom total dan discount pada baris dengan barang_id 3 dalam tabel barang6 akan diubah sesuai 
dengan nilai yang ditetapkan. Pastikan bahwa kondisi WHERE sesuai dengan kebutuhan Anda untuk memastikan pembaruan hanya 
diterapkan pada baris yang diinginkan.
*/
UPDATE barang6
SET 
	total=11,
	discount=2000000
WHERE barang_id=3

/*
-- Update Join  

Query SQL di bawah adalah contoh dari pernyataan UPDATE yang menggunakan JOIN untuk memperbarui nilai kolom price 
pada tabel barang6 berdasarkan kondisi pada tabel lain (barang6_brand). Mari kita jelaskan setiap bagian dari query tersebut:

	- UPDATE barang6: 
		Menentukan tabel yang akan diperbarui, dalam hal ini, tabel adalah barang6.

	- SET price = price + 500000: 
		Menetapkan nilai kolom price menjadi nilai kolom price ditambah 500000.

	- FROM barang6 AS A INNER JOIN barang6_brand AS B ON A.brand_id = B.brand_id: 
		Menggunakan INNER JOIN untuk menggabungkan tabel barang6 (diberi alias A) dan barang6_brand (diberi alias B) berdasarkan 
		kunci hubung yang sesuai, yaitu brand_id.

	- WHERE B.brand_name = 'Apple': 
		Menentukan kondisi di mana pembaruan akan diterapkan. Pembaruan akan terjadi hanya pada baris-baris di mana brand_name 
		di tabel barang6_brand adalah 'Apple'.

Dengan menjalankan query ini, nilai kolom price pada baris-baris yang sesuai dengan kondisi akan diperbarui dengan menambahkan 
500000. Pastikan bahwa kondisi WHERE sesuai dengan kebutuhan Anda untuk memastikan pembaruan hanya diterapkan pada baris yang 
diinginkan berdasarkan kriteria pada tabel lain.
*/
UPDATE barang6
SET price=price+500000
FROM barang6 AS A
INNER JOIN barang6_brand AS B ON A.brand_id=B.brand_id
WHERE B.brand_name='Apple'

/*
Query SQL di bawah adalah contoh dari pernyataan SELECT yang menggunakan INNER JOIN untuk menggabungkan dua tabel 
(barang6 dan barang6_brand) berdasarkan kunci hubung (brand_id) dan memilih data yang memenuhi kondisi tertentu.

Dengan menjalankan query ini, Anda akan mendapatkan hasil yang terdiri dari semua kolom dari kedua tabel yang memenuhi kondisi 
yang ditetapkan, yaitu baris-baris yang terkait dengan brand_name = 'Apple'. 
*/
SELECT * FROM barang6 AS A
INNER JOIN barang6_brand AS B ON A.brand_id=B.brand_id
WHERE B.brand_name='Apple'