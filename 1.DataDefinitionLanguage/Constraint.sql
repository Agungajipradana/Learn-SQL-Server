/*
Di SQL Server, CONSTRAINT adalah aturan atau pembatasan yang diterapkan pada sebuah tabel untuk memastikan integritas data 
dan konsistensi struktur database. CONSTRAINT dapat digunakan untuk menerapkan berbagai aturan, mulai dari keunikan nilai di dalam 
sebuah kolom (seperti PRIMARY KEY dan UNIQUE CONSTRAINT), ketidakbolehan nilai NULL (seperti NOT NULL CONSTRAINT), 
hingga hubungan antar tabel (seperti FOREIGN KEY CONSTRAINT).

Berikut adalah beberapa jenis CONSTRAINT yang umum digunakan:

	1.PRIMARY KEY CONSTRAINT:

		Memastikan bahwa kolom atau kombinasi kolom memiliki nilai unik di setiap baris dan tidak dapat memiliki nilai NULL. 
		Hanya satu PRIMARY KEY CONSTRAINT diizinkan dalam satu tabel.

			CREATE TABLE ExampleTable (
				ID INT PRIMARY KEY,
				Name VARCHAR(50)
			);

	2.UNIQUE CONSTRAINT:

		Memastikan bahwa nilai di dalam kolom atau kombinasi kolom bersifat unik di seluruh tabel. Mirip dengan PRIMARY KEY, 
		tetapi tidak mengharuskan nilai yang unik menjadi identifier utama.

			CREATE TABLE ExampleTable (
				Email VARCHAR(100) UNIQUE,
				Phone VARCHAR(20) UNIQUE
			);

	3.NOT NULL CONSTRAINT:

		Memastikan bahwa kolom memiliki nilai yang tidak boleh NULL (kosong).

			CREATE TABLE ExampleTable (
				ID INT,
				Name VARCHAR(50) NOT NULL
			);

	4.FOREIGN KEY CONSTRAINT:

		Membuat hubungan referensial antara kolom di dalam tabel anak dan kolom yang merupakan PRIMARY KEY di dalam tabel utama.

			CREATE TABLE Orders (
				OrderID INT PRIMARY KEY,
				ProductID INT,
				FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
			);

	5.CHECK CONSTRAINT:

		Memeriksa nilai dalam sebuah kolom atau kolom-kolom untuk memastikan bahwa memenuhi kondisi tertentu.

			CREATE TABLE ExampleTable (
				Age INT CHECK (Age >= 18),
				Salary DECIMAL(10, 2) CHECK (Salary >= 0)
			);

Semua jenis CONSTRAINT ini memberikan cara untuk menentukan aturan dan kebijakan terkait data dan struktur database, dan 
penggunaan yang tepat tergantung pada kebutuhan spesifik dari desain basis data dan aturan bisnis yang diterapkan. 
CONSTRAINT dapat ditambahkan saat membuat tabel atau dapat ditambahkan setelahnya menggunakan perintah ALTER TABLE.
*/