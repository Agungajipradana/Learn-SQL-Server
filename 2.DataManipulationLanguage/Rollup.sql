/*
ROLLUP adalah klausa dalam SQL Server yang digunakan untuk melakukan operasi pengelompokan dengan tingkatan (hierarchical). 
Klausa ini menghasilkan hasil agregat yang mencakup subtotal untuk tingkatan hierarki yang ditentukan. 
Hasilnya mencakup nilai-nilai subtotal dari tingkat paling rendah hingga tingkat paling tinggi dalam hierarki kolom pengelompokan 
yang ditentukan.

Contoh penggunaan ROLLUP dalam SQL Server adalah sebagai berikut:

	SELECT 
		A.brand_name,
		B.category_name,
		SUM(C.price) AS total_price
	FROM 
		barang6_brand AS A
		INNER JOIN barang6 AS C ON A.brand_id = C.brand_id
		INNER JOIN barang6_category AS B ON C.category_id = B.category_id
	GROUP BY 
		ROLLUP (A.brand_name, B.category_name);

Dalam contoh ini, klausa ROLLUP (A.brand_name, B.category_name) akan menghasilkan subtotal untuk brand_name dan category_name. 
Hasilnya mencakup total untuk setiap kombinasi, total untuk setiap merek (brand_name), dan total keseluruhan.

Penting untuk dicatat bahwa ROLLUP menyederhanakan proses penghitungan subtotal dan total untuk tingkatan hierarki yang diinginkan. 
Meskipun penggunaan ROLLUP dapat menyederhanakan kueri untuk hasil agregat yang hierarkis, perlu diperhatikan bahwa hasilnya 
dapat menjadi lebih besar dan lebih kompleks tergantung pada tingkatan hierarki yang diinginkan.
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
		--(B.category_name),
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


--------------------------------------------------------------- ROLLUP -----------------------------------------------------------
/*
1. SELECT: Menentukan kolom-kolom yang ingin ditampilkan dalam hasil query.

	- B.brand_name: Nama merek.
	- A.barang_name: Nama barang.
	- SUM(A.price) AS total: Total harga dari kolom price dalam setiap kelompok.

2. FROM: Menentukan tabel atau sumber data yang digunakan dalam query, dalam hal ini tabel barang6.

3. INNER JOIN: Menggabungkan tabel barang6 dan barang6_brand berdasarkan kriteria tertentu.

4. GROUP BY ROLLUP: Menggunakan klausa ROLLUP untuk melakukan pengelompokan dengan tingkatan pada kombinasi kolom brand_name 
	dan barang_name. Ini menghasilkan subtotal untuk setiap kombinasi, subtotal untuk setiap merek, dan total keseluruhan.

Hasil dari query ini mencakup informasi agregat pada beberapa tingkatan hierarki, sehingga memberikan gambaran yang lebih 
komprehensif dari data. Jika tidak ada nilai NULL pada kolom brand_name dan barang_name, maka hasilnya akan mencakup subtotal 
untuk setiap kombinasi yang unik, subtotal untuk setiap merek, dan total keseluruhan.
*/
SELECT 
	B.brand_name,
    A.barang_name,
    SUM(A.price) AS total
FROM 
	barang6 AS A
	INNER JOIN barang6_brand AS B ON A.brand_id = B.brand_id
GROUP BY 
	ROLLUP(
	B.brand_name,
    A.barang_name
	)

----------------------------------------------- Perbedaan ROLLUP, GROUPING SETS, dan CUBE ----------------------------------------

/*
ROLLUP, GROUPING SETS, dan CUBE adalah klausa pengelompokan dalam SQL Server yang dapat digunakan untuk menghasilkan hasil 
agregat dengan tingkatan hierarki atau kombinasi kolom yang berbeda. Berikut adalah perbandingan antara ketiganya:

1. ROLLUP:
	
	- Pengelompokan Hierarki: ROLLUP menghasilkan subtotal untuk tingkat hierarki yang diidentifikasi. Dalam contoh Anda, 
	subtotal akan diperoleh untuk setiap kombinasi brand_name dan barang_name, subtotal untuk setiap brand_name, dan total 
	keseluruhan.

	- Kemampuan Hierarkis: Cocok digunakan ketika Anda ingin menghasilkan subtotal untuk hierarki tertentu tanpa memperhitungkan 
	setiap kombinasi mungkin.

	- Contoh Penggunaan: Menyajikan data secara hierarkis, misalnya, subtotal untuk setiap kategori dan total keseluruhan.

2. GROUPING SETS:

	- Pengelompokan Fleksibel: Dengan GROUPING SETS, Anda dapat menentukan sendiri set tingkat pengelompokan yang diinginkan. 
	Hasilnya mencakup setiap kombinasi yang Anda tentukan.

	- Fleksibilitas: Memberikan fleksibilitas lebih besar karena Anda dapat memilih kombinasi pengelompokan yang diinginkan.
	
	- Contoh Penggunaan: Berguna ketika Anda ingin menghasilkan subtotal untuk setiap kombinasi yang spesifik, 
	tidak hanya pada tingkat hierarki tertentu.

3. CUBE:

	- Semua Kombinasi Mungkin: CUBE menghasilkan semua kombinasi mungkin dari nilai-nilai yang ada dalam kolom pengelompokan.
	
	- Kompleksitas Hasil: Menghasilkan hasil yang lebih besar dan kompleks karena mencakup semua kombinasi.

	- Contoh Penggunaan: Cocok untuk analisis lintas dimensi di mana Anda ingin melibatkan setiap kombinasi nilai.

Kesimpulan:

	- Jika Anda ingin menghasilkan subtotal untuk tingkat hierarki tertentu, ROLLUP bisa menjadi pilihan yang baik.

	- Jika Anda ingin fleksibilitas penuh dalam menentukan set tingkat pengelompokan, GROUPING SETS adalah solusi yang baik.

	- Jika Anda ingin mencakup semua kombinasi mungkin dari nilai-nilai yang ada, gunakan CUBE.

Pilihan antara ketiganya tergantung pada kebutuhan spesifik dan tingkat rinci yang diinginkan dalam hasil agregat Anda. 
Semua tiga klausa ini menyediakan cara yang fleksibel untuk melakukan analisis data dengan tingkat pengelompokan yang berbeda.
*/
	