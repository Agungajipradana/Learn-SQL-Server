/*
Secara umum, Anda dapat menggunakan klausa VALUES untuk menyisipkan beberapa baris data dalam satu pernyataan INSERT. 
Berikut adalah contoh penggunaan:

INSERT INTO nama_tabel (kolom1, kolom2, kolom3)
VALUES 
  (nilai1_1, nilai1_2, nilai1_3),
  (nilai2_1, nilai2_2, nilai2_3),
  (nilai3_1, nilai3_2, nilai3_3);

Di sini, kita menyisipkan tiga baris data sekaligus ke dalam tabel nama_tabel. Setiap nilai di dalam tanda kurung mewakili satu 
baris data. Pastikan untuk mencocokkan jumlah dan urutan nilai dengan jumlah dan urutan kolom dalam tabel.
*/

SP_HELP employee
SELECT * FROM employee

/*
Query SQL di bawah adalah pernyataan INSERT INTO yang digunakan untuk menyisipkan beberapa baris data ke dalam tabel employee 
di SQL Server. Berikut adalah penjelasan langkah demi langkahnya:

- INSERT INTO employee (name, address, phone, manager_id):

	- Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel employee dan menentukan kolom-kolom yang akan diisi dengan 
	nilai baru. Kolom-kolom yang diisi adalah name, address, phone, dan manager_id.

- VALUES:

	- Klausa VALUES digunakan untuk menyediakan nilai untuk setiap kolom dalam urutan yang sesuai. Nilai ini disediakan dalam 
	tanda kurung dan dipisahkan oleh koma.

- Baris-baris Data:

	- Terdapat tiga baris data yang akan disisipkan ke dalam tabel. Setiap baris data berisi nilai untuk masing-masing kolom:
		1. Nama: 'Zidan', Alamat: 'Bogor', Nomor Telepon: '08212430847', ID Manajer: 30
		2. Nama: 'Shaskia Aura', Alamat: 'Jepara', Nomor Telepon: '08212430848', ID Manajer: 31
		3. Nama: 'Fatir', Alamat: 'Surabaya', Nomor Telepon: '08212430849', ID Manajer: 32

Dengan menjalankan query ini, Anda akan menyisipkan tiga baris data baru ke dalam tabel employee. 
Pastikan bahwa nilai-nilai yang dimasukkan sesuai dengan struktur dan tipe data yang diperlukan oleh kolom-kolom di tabel tersebut.
*/
INSERT INTO employee (name, address, phone, manager_id) 
VALUES	
	('Zidan', 'Bogor', '08212430847', 30),
	('Shaskia Aura', 'Jepara', '08212430848', 31),
	('Fatir', 'Surabaya', '08212430849', 32)

/*
Query SQL di bawah adalah dua pernyataan INSERT INTO yang digunakan untuk menyisipkan dua baris data ke dalam tabel employee 
di SQL Server. Mari jelaskan langkah-langkahnya:

1. Pernyataan Pertama:

	INSERT INTO employee (name, address, phone, manager_id) VALUES ('Sultan Adijaya', 'Makasar', '08212430850', 33)

	- Menunjukkan bahwa kita akan menyisipkan satu baris data ke dalam tabel employee dan menentukan kolom-kolom yang akan 
	diisi dengan nilai baru. Kolom-kolom yang diisi adalah name, address, phone, dan manager_id.
	- Nilai yang disediakan adalah:
		- Nama: 'Sultan Adijaya'
		- Alamat: 'Makasar'
		- Nomor Telepon: '08212430850'
		- ID Manajer: 33

2. Pernyataan Kedua:

	INSERT INTO employee (name, address, phone, manager_id) VALUES ('Zaki', 'Jepara', '08212430851', 34)

	- Mirip dengan pernyataan pertama, menyisipkan satu baris data ke dalam tabel employee.
	- Nilai yang disediakan adalah:
		- Nama: 'Zaki'
		- Alamat: 'Jepara'
		- Nomor Telepon: '08212430851'
		- ID Manajer: 34

Dengan menjalankan kedua pernyataan ini, Anda akan menyisipkan dua baris data baru ke dalam tabel employee. 
Pastikan bahwa nilai-nilai yang dimasukkan sesuai dengan struktur dan tipe data yang diperlukan oleh kolom-kolom di tabel tersebut. 
Pada catatan praktis, seringkali lebih efisien menggunakan satu pernyataan INSERT dengan multiple VALUES, 
seperti yang ditunjukkan pada contoh sebelumnya.
*/
INSERT INTO employee (name, address, phone, manager_id) VALUES ('Sultan Adijaya', 'Makasar', '08212430850', 33)
INSERT INTO employee (name, address, phone, manager_id) VALUES ('Zaki', 'Jepara', '08212430851', 34)
