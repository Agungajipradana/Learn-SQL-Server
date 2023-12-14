/*
CUBE adalah klausa dalam SQL Server yang digunakan untuk melakukan operasi pengelompokan multi-dimensi. 
Ini menghasilkan hasil agregat yang mencakup semua kombinasi mungkin dari nilai-nilai yang ada dalam kolom pengelompokan. 
CUBE menggabungkan hasil dari GROUP BY dan GROUPING SETS, memberikan hasil agregat yang mencakup setiap kombinasi 
semua kolom yang diidentifikasi dalam klausa CUBE.

Contoh penggunaan CUBE dalam SQL Server adalah sebagai berikut:

	SELECT 
		A.brand_name,
		B.category_name,
		SUM(C.price) AS total_price
	FROM 
		barang6_brand AS A
		INNER JOIN barang6 AS C ON A.brand_id = C.brand_id
		INNER JOIN barang6_category AS B ON C.category_id = B.category_id
	GROUP BY 
		CUBE (A.brand_name, B.category_name);

Dalam contoh ini, klausa CUBE (A.brand_name, B.category_name) akan menghasilkan semua kombinasi mungkin dari brand_name dan 
category_name, termasuk total dari brand_name, total dari category_name, dan total keseluruhan. Hasil ini mencakup semua 
kombinasi mungkin dan memberikan gambaran yang lebih komprehensif dari data.

Penting untuk dicatat bahwa penggunaan CUBE dapat menyebabkan banyak baris dalam hasil, terutama jika terdapat banyak kolom 
yang diidentifikasi dalam klausa CUBE. Oleh karena itu, CUBE biasanya lebih sesuai untuk analisis data di tingkat tinggi dan 
tidak selalu diperlukan dalam setiap query.
*/

---------------------------------------------------------- GROUPING SETS ---------------------------------------------------------

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

--------------------------------------------------------------- CUBE ------------------------------------------------------------

/*
1. SELECT: Menentukan kolom-kolom yang ingin ditampilkan dalam hasil query.

	- C.brand_name: Nama merek.
	- B.category_name: Nama kategori.
	- SUM(A.price) AS total: Total harga dari kolom price dalam setiap kelompok.

2. FROM: Menentukan tabel atau sumber data yang digunakan dalam query, dalam hal ini tabel barang6.

3. INNER JOIN: Menggabungkan tabel barang6, barang6_category, dan barang6_brand berdasarkan kriteria tertentu.

4. GROUP BY CUBE: Menggunakan klausa CUBE untuk melakukan pengelompokan multi-dimensi berdasarkan brand_name dan category_name. 
	Ini menghasilkan semua kombinasi mungkin dari nilai-nilai tersebut.

5. ORDER BY: Mengurutkan hasil secara ascending berdasarkan brand_name dan category_name.

Klausa CUBE di sini menghasilkan hasil yang mencakup total untuk setiap brand_name, category_name, dan kombinasi kedua-duanya. 
Hal ini memberikan gambaran yang lebih komprehensif dari data dengan memasukkan informasi pada tingkat yang lebih tinggi dan 
lebih rendah sekaligus. Namun, perlu diingat bahwa hasil yang dihasilkan oleh CUBE dapat menjadi kompleks, terutama jika terdapat 
banyak kolom yang diikutsertakan dalam pengelompokan.
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
	CUBE( C.brand_name, B.category_name)
ORDER BY 
	C.brand_name, B.category_name asc


--------------------------------------------------- Perbedaan GROUPING SETS dan CUBE --------------------------------------------

/*
1. Pengelompokan yang Dihasilkan:
	
	- GROUPING SETS: Anda menentukan sendiri set tingkat pengelompokan yang diinginkan, dan hasilnya akan mencakup 
	setiap set yang Anda tentukan.
	
	- CUBE: Menghasilkan semua kombinasi mungkin dari nilai-nilai yang ada dalam kolom pengelompokan.

2. Fleksibilitas:

	- GROUPING SETS: Memberikan fleksibilitas lebih besar karena Anda dapat memilih sendiri kombinasi pengelompokan yang 
	diinginkan.

	- CUBE: Menghasilkan semua kombinasi, yang mungkin terlalu rinci jika Anda hanya tertarik pada beberapa tingkat 
	pengelompokan tertentu.

3. Kesulitan dan Ukuran Hasil:
	
	- GROUPING SETS: Biasanya memberikan hasil yang lebih mudah diinterpretasikan dan memungkinkan Anda mengendalikan ukuran hasil.
	
	- CUBE: Dapat menghasilkan hasil yang besar dan kompleks karena mencakup semua kombinasi.

4. Kinerja:
	
	- GROUPING SETS: Dapat lebih efisien karena hanya menghitung set pengelompokan yang Anda tentukan.
	
	- CUBE: Memiliki potensi untuk menjadi lebih mahal dari segi kinerja karena mencakup semua kombinasi.

Kesimpulan:
- Jika Anda memerlukan fleksibilitas dan kontrol yang lebih besar terhadap tingkat pengelompokan, dan hanya tertarik pada 
beberapa kombinasi tertentu, gunakan GROUPING SETS.

- Jika Anda ingin menghasilkan semua kombinasi mungkin dari nilai-nilai yang ada, gunakan CUBE.
Keduanya memiliki kegunaan mereka masing-masing tergantung pada kebutuhan analisis dan laporan data Anda.
*/