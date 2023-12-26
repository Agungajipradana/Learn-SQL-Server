/*
Pernyataan MERGE dalam SQL Server adalah pernyataan yang digunakan untuk melakukan operasi INSERT, UPDATE, atau DELETE dalam satu 
pernyataan. Pernyataan ini berguna saat Anda ingin memeriksa apakah data sudah ada dalam tabel target berdasarkan kriteria 
tertentu. Jika data sudah ada, Anda dapat memutuskan apakah akan memperbarui data tersebut atau memasukkan data baru. 
Jika data belum ada, Anda dapat memutuskan untuk memasukkannya.

Berikut adalah contoh sintaksis umum dari pernyataan MERGE:

	MERGE INTO target_table AS target
	USING source_table AS source
	ON <join_condition>
	WHEN MATCHED THEN
		UPDATE SET column1 = value1, column2 = value2, ...
	WHEN NOT MATCHED THEN
		INSERT (column1, column2, ...)
		VALUES (value1, value2, ...);

Penjelasan:

	- target_table: 
		Tabel yang menjadi tujuan operasi MERGE.

	- source_table: 
		Tabel yang menyediakan data untuk digunakan dalam operasi MERGE.

	- <join_condition>: 
		Kondisi untuk menghubungkan baris-baris di antara target_table dan source_table.

	- WHEN MATCHED: 
		Bagian ini mendefinisikan tindakan yang diambil saat ada kecocokan (baris di target_table dan source_table cocok).

	- UPDATE SET: 
		Mendefinisikan pembaruan kolom pada baris yang cocok.

	- WHEN NOT MATCHED: 
		Bagian ini mendefinisikan tindakan yang diambil saat tidak ada kecocokan (baris di target_table tidak memiliki kecocokan 
		di source_table).

	- INSERT: 
		Mendefinisikan kolom dan nilai untuk dimasukkan saat tidak ada kecocokan.

Pernyataan MERGE sangat bermanfaat dalam skenario di mana Anda perlu menggabungkan operasi INSERT, UPDATE, dan DELETE dalam 
satu pernyataan, terutama ketika bekerja dengan sinkronisasi data antara tabel.
*/

SELECT * FROM category
SELECT * FROM category_temp

-- Menambahkan column "price" dengan tipe data "MONEY" pada table "category"
ALTER TABLE category
ADD price MONEY

-- Menambahkan data pada table "category"
INSERT INTO category (category_name, price) 
VALUES  ('Laptop', 10000000),
		('Velg', 20000000),
		('Burger', 100000)

-- Membuat table baru dengan nama "category_temp"
CREATE TABLE category_temp (
	category_id INT IDENTITY PRIMARY KEY,
	category_name VARCHAR(50),
	price MONEY
)

--
TRUNCATE TABLE category

-- Menambahkan data pada table "category"
INSERT INTO category_temp (category_name, price) 
VALUES  ('Electric', 10000000),
		('Electronic Temp', 10000000),
		('Otomotif Temp', 20000000),
		('Food Temp', 100000),
		('Drink Temp', 25000)

-- Menghapus row pada table "category_temp" dimana "WHERE category_id=1"
DELETE FROM category_temp 
WHERE category_id=1

-- Membuat "IDENTITY" pada table "category" menjadi manual (tidak auto increment)
SET IDENTITY_INSERT category ON

/*
Query SQL di bawah adalah contoh dari pernyataan MERGE yang digunakan untuk menggabungkan operasi INSERT, UPDATE, dan DELETE 
dalam satu pernyataan. Berikut adalah penjelasan langkah-langkahnya:

1. MERGE category AS C USING category_temp AS T ON C.category_id = T.category_id:

	- category adalah tabel target.
	- category_temp adalah tabel sumber.
	- ON C.category_id = T.category_id menentukan kondisi untuk mencocokkan baris di antara kedua tabel.

2. WHEN MATCHED THEN UPDATE SET C.category_name = T.category_name, C.price = T.price:

	- Jika ada kecocokan antara baris di tabel target (category) dan tabel sumber (category_temp) berdasarkan category_id, 
	maka lakukan operasi UPDATE untuk memperbarui kolom category_name dan price di tabel target dengan nilai dari tabel sumber.

3. WHEN NOT MATCHED BY TARGET THEN INSERT (category_id, category_name, price) VALUES (T.category_id, T.category_name, T.price):

	- Jika tidak ada kecocokan pada category_id di tabel target, tapi ada di tabel sumber, maka lakukan operasi INSERT untuk 
	memasukkan baris baru ke tabel target dengan nilai dari tabel sumber.

4. WHEN NOT MATCHED BY SOURCE THEN DELETE:

	- Jika tidak ada kecocokan pada category_id di tabel sumber, tapi ada di tabel target, maka lakukan operasi DELETE untuk 
	menghapus baris dari tabel target.

Dengan menggunakan pernyataan MERGE ini, Anda dapat menghindari beberapa pernyataan terpisah dan menjalankan operasi INSERT, 
UPDATE, dan DELETE sesuai kebutuhan, semuanya dalam satu pernyataan yang bersifat transaksional.
*/
MERGE category AS C
	USING category_temp AS T 
	ON C.category_id = T.category_id
WHEN MATCHED
	THEN UPDATE SET
		C.category_name = T.category_name,
		C.price = T.price
WHEN NOT MATCHED BY TARGET
	THEN INSERT (category_id, category_name, price)
	VALUES (T.category_id, T.category_name, T.price)
WHEN NOT MATCHED BY SOURCE
	THEN DELETE;