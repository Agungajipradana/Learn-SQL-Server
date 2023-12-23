/*
Dalam konteks SQL Server, "INSERT DATA" biasanya mengacu pada pernyataan SQL INSERT INTO yang digunakan untuk menyisipkan data 
baru ke dalam tabel. Pernyataan ini memungkinkan Anda menambahkan satu atau beberapa baris data ke dalam tabel.

Berikut adalah contoh sederhana penggunaan pernyataan INSERT INTO:

-- Contoh 1: Menyisipkan satu baris data
INSERT INTO nama_tabel (kolom1, kolom2, kolom3)
VALUES (nilai1, nilai2, nilai3);

-- Contoh 2: Menyisipkan beberapa baris data sekaligus
INSERT INTO nama_tabel (kolom1, kolom2, kolom3)
VALUES (nilai1a, nilai2a, nilai3a),
       (nilai1b, nilai2b, nilai3b),
       (nilai1c, nilai2c, nilai3c);

Penjelasan:

	- INSERT INTO: Menunjukkan bahwa Anda ingin menyisipkan data ke dalam tabel.
	- nama_tabel: Nama tabel di mana data akan disisipkan.
	- (kolom1, kolom2, kolom3): Nama kolom yang akan diisi dengan nilai.
	- VALUES: Kata kunci yang menandakan dimulainya nilai yang akan disisipkan.
	- (nilai1, nilai2, nilai3): Nilai untuk setiap kolom yang dijelaskan sebelumnya.

Penting untuk mencocokkan urutan kolom dan nilai sehingga data disisipkan dengan benar.

Anda juga dapat menggunakan pernyataan INSERT INTO dengan subquery atau menggunakan data dari tabel lain untuk menyisipkan data. 
Misalnya:

-- Contoh: Menyisipkan data dari SELECT
INSERT INTO tujuan_tabel (kolom1, kolom2, kolom3)
SELECT kolom1, kolom2, kolom3
FROM sumber_tabel
WHERE kondisi;

Perhatikan bahwa sebelum menggunakan pernyataan INSERT INTO, pastikan untuk memahami struktur tabel (kolom dan tipe data) dan 
mengonfirmasi bahwa nilai yang akan disisipkan sesuai dengan persyaratan tabel.
*/

SELECT * FROM INFORMATION_SCHEMA.TABLES
SP_HELP employee
SELECT * FROM employee

/*
Query SQL di bawah adalah pernyataan INSERT INTO yang bertujuan untuk menyisipkan data baru ke dalam tabel employee pada database 
SQL Server. Pernyataan tersebut mencoba menambahkan data karyawan baru dengan nilai sebagai berikut:

Nama: 'Riswan Hakim'
Alamat: 'Bogor'
Nomor Telepon: '08212430844'
ID Manajer: 27
*/
INSERT INTO employee (name, address, phone, manager_id) VALUES ('Riswan Hakim', 'Bogor', '08212430844', 27)

/*
Query SQL di bawah adalah pernyataan INSERT INTO yang mencoba menyisipkan data baru ke dalam tabel employee pada database 
SQL Server. Pernyataan ini juga menggunakan klausa OUTPUT untuk mengembalikan nilai dari kolom emp_id dari baris yang baru 
saja disisipkan.

Berikut adalah penjelasan langkah demi langkah:

1. INSERT INTO:

	- INSERT INTO employee (name, address, phone, manager_id): Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel 
	employee dan menentukan kolom yang akan diisi dengan nilai baru.
	- VALUES ('Ginca', 'Jakarta', '08212430845', 28): Menyediakan nilai untuk setiap kolom yang dijelaskan sebelumnya. 
	Data baru adalah:
		- Nama: 'Ginca'
		- Alamat: 'Jakarta'
		- Nomor Telepon: '08212430845'
		- ID Manajer: 28

2. OUTPUT inserted.emp_id:

	- Klausa OUTPUT inserted.emp_id digunakan untuk mengembalikan nilai dari kolom emp_id dari baris yang baru saja disisipkan. 
	Nilai ini kemudian dapat ditangkap oleh pemanggil query atau program untuk digunakan lebih lanjut.

3. SELECT * FROM employee WHERE emp_id=28:

	- Setelah operasi INSERT selesai, query SELECT digunakan untuk menampilkan seluruh kolom dari tabel employee dimana emp_id 
	sama dengan 28. Ini adalah langkah verifikasi untuk memastikan bahwa data telah berhasil disisipkan.

Jadi, query ini tidak hanya menyisipkan data baru ke dalam tabel employee, tetapi juga mengembalikan nilai emp_id dari baris 
yang baru saja disisipkan. Hasilnya kemudian dapat digunakan atau dilihat melalui hasil query SELECT.
*/
INSERT INTO employee (name, address, phone, manager_id) 
OUTPUT inserted.emp_id
VALUES ('Ginca', 'Jakarta', '08212430845', 28)

SELECT * FROM employee WHERE emp_id=28

/*
Query SQL di bawah menggunakan pernyataan SET IDENTITY_INSERT untuk mengaktifkan fitur IDENTITY_INSERT dan kemudian menyisipkan 
data baru ke dalam tabel employee. Mari kita jelaskan langkah-langkahnya:

1. SET IDENTITY_INSERT employee ON:

	- Pernyataan ini mengaktifkan fitur IDENTITY_INSERT untuk tabel employee. Fitur ini memungkinkan Anda menyisipkan nilai 
	eksplisit ke dalam kolom yang memiliki properti IDENTITY. Dalam hal ini, kolom emp_id mungkin memiliki properti IDENTITY.

2. INSERT INTO employee (emp_id, name, address, phone, manager_id):

	- INSERT INTO employee: Menunjukkan bahwa kita akan menyisipkan data ke dalam tabel employee.
	- (emp_id, name, address, phone, manager_id): Menentukan kolom yang akan diisi dengan nilai baru.
		- emp_id memiliki nilai eksplisit 29.
		- name: 'Fauziah'
		- address: 'Jakarta'
		- phone: '08212430846'
		- manager_id: 29

3. OUTPUT inserted.emp_id:

	- Klausa OUTPUT inserted.emp_id digunakan untuk mengembalikan nilai dari kolom emp_id dari baris yang baru saja disisipkan. 
	Nilai ini kemudian dapat ditangkap oleh pemanggil query atau program untuk digunakan lebih lanjut.

Sebagai catatan, penggunaan SET IDENTITY_INSERT secara langsung memungkinkan Anda menyisipkan nilai eksplisit ke dalam kolom 
identitas. Ini digunakan ketika Anda ingin menyediakan nilai khusus untuk kolom identitas, yang sebaliknya akan dihasilkan secara 
otomatis oleh database. Setelah operasi selesai, Anda mungkin perlu menonaktifkan kembali fitur IDENTITY_INSERT 
menggunakan pernyataan SET IDENTITY_INSERT employee OFF.

Jadi, query ini menyisipkan data baru ke dalam tabel employee dengan memberikan nilai eksplisit untuk kolom emp_id.
*/
SET IDENTITY_INSERT employee ON
INSERT INTO employee (emp_id, name, address, phone, manager_id) 
OUTPUT inserted.emp_id
VALUES (29, 'Fauziah', 'Jakarta', '08212430846', 29)

/*
Query SQL SET IDENTITY_INSERT employee ON digunakan untuk mengaktifkan fitur IDENTITY_INSERT pada tabel employee. 
Mari jelaskan dengan lebih detail:

	- SET IDENTITY_INSERT employee ON:
		- Pernyataan ini mengaktifkan fitur IDENTITY_INSERT pada tabel employee. Fitur ini memungkinkan Anda untuk menyisipkan 
		nilai eksplisit ke dalam kolom yang memiliki properti IDENTITY. Dengan kata lain, Anda dapat menyisipkan nilai ke 
		dalam kolom identitas.

		- Fitur ini biasanya digunakan ketika Anda ingin menyediakan nilai khusus untuk kolom identitas, yang sebaliknya akan 
		dihasilkan secara otomatis oleh database. Setelah menonaktifkan fitur ini (SET IDENTITY_INSERT employee OFF), 
		database akan kembali menghasilkan nilai identitas secara otomatis.

Jadi, setelah menjalankan pernyataan ini, Anda dapat menyisipkan nilai eksplisit ke dalam kolom identitas emp_id dalam tabel 
employee selama fitur ini masih aktif. Setelah selesai, disarankan untuk menonaktifkan kembali fitur IDENTITY_INSERT menggunakan 
pernyataan SET IDENTITY_INSERT employee OFF.
*/
SET IDENTITY_INSERT employee ON

/*
Query SQL SET IDENTITY_INSERT employee OFF digunakan untuk menonaktifkan fitur IDENTITY_INSERT pada tabel employee. 

Mari kita jelaskan dengan lebih detail:

	- SET IDENTITY_INSERT employee OFF:
	
		- Pernyataan ini menonaktifkan fitur IDENTITY_INSERT pada tabel employee. Fitur ini umumnya digunakan ketika Anda telah 
		selesai menyisipkan nilai eksplisit ke dalam kolom identitas (biasanya emp_id), dan Anda ingin kembali ke mode normal 
		di mana database akan secara otomatis menghasilkan nilai untuk kolom identitas.

Jadi, setelah menjalankan pernyataan ini, database tidak akan lagi memungkinkan penyisipan nilai eksplisit ke dalam kolom 
identitas tanpa menonaktifkan kembali fitur IDENTITY_INSERT untuk tabel yang bersangkutan. Hal ini memastikan bahwa nilai 
kolom identitas akan dihasilkan secara otomatis oleh database untuk setiap penyisipan data berikutnya ke dalam tabel.
*/
SET IDENTITY_INSERT employee OFF


