/*
WHERE adalah klausa yang digunakan dalam pernyataan SQL Server untuk memfilter baris berdasarkan kondisi tertentu. 
Dengan menggunakan WHERE, Anda dapat menentukan kondisi yang harus dipenuhi oleh setiap baris yang akan dimasukkan dalam hasil query. 
Hanya baris-baris yang memenuhi kondisi yang akan disertakan dalam hasil query akhir.

Berikut adalah sintaksis umum dari klausa WHERE:

	SELECT column1, column2, ...
	FROM table_name
	WHERE condition;

	- column1, column2, ...: Kolom-kolom yang ingin Anda ambil dari tabel.
	- table_name: Nama tabel dari mana data akan diambil.
	- WHERE condition: Kondisi yang harus dipenuhi oleh setiap baris yang akan dimasukkan dalam hasil query. 
	Jika baris memenuhi kondisi, itu akan disertakan; jika tidak, akan diabaikan.

Contoh penggunaan WHERE:

	-- Mengambil data dari tabel 'employees' hanya untuk karyawan dengan gaji di atas 50000
	SELECT employee_id, first_name, last_name, salary
	FROM employees
	WHERE salary > 50000;

	Dalam contoh ini, hanya baris-baris di tabel 'employees' di mana gaji lebih besar dari 50000 akan dimasukkan dalam hasil query.

WHERE sangat berguna untuk menyaring data dan membatasi hasil query hanya pada baris-baris yang relevan dengan kondisi tertentu. 
Kondisi dalam WHERE dapat melibatkan perbandingan (seperti <, >, <=, >=, <>), operator logika (seperti AND, OR), 
dan banyak fitur lainnya untuk mengatur aturan filtrasi sesuai kebutuhan Anda.
*/

select * from barang5

-- melakukan update pada table "barang5": Nama tabel yang berisi data yang ingin Anda perbarui.
-- SET barang_name = 'Laptop Asus ROG Strix': Menetapkan nilai baru untuk kolom-kolom yang ingin Anda perbarui.
-- WHERE barang_id = 3: Kondisi untuk membatasi baris-baris yang akan diperbarui. 
-- Jika tidak ada kondisi, semua baris dalam tabel akan diperbarui.
UPDATE barang5
SET barang_name = 'Laptop Asus ROG Strix'
WHERE barang_id = 3;

-- menampilkan semua data pada table "barang5" dengan kondisi "where" yang dimana pada column "total=10" memiliki nilai 10
select * from barang5 where total=10

-- menampilkan semua data pada table "barang5" dengan kondisi "and" 
-- yang dimana pada column "total=10" memiliki nilai 10 dan "barang_id=2" memiliki nilai 2
select * from barang5 where total=10 and barang_id=2

-- menampilkan semua data pada table "barang5" 
-- yang dimana pada column "total > 10" memiliki nilai lebih dari 10
select * from barang5 where total > 10

-- menampilkan semua data pada table "barang5" dengan kondisi "or"
-- yang dimana pada column "total = 15" memiliki nilai sama dengan 15 dan "barang_id=4" mimiliki nilai 4.
-- Apabila salah satu kondisi terpenuhi makan akan menampilkan datanya
select * from barang5 where total = 15 or barang_id=4

-- menampilkan semua data pada table "barang5" dengan kondisi "between"
-- yang dimana pada column "total" between 10 and 15 yang akan menampilkan nilai antara 10 dan 15
select * from barang5 where total between 10 and 15

-- menampilkan semua data pada table "barang5" dengan kondisi "in"
-- yang dimana pada column "total" in (10,15) yang akan menampilkan nilai sama dengan 10 atau 15
select * from barang5 where total in (10,15)

/*
BETWEEN: Digunakan untuk menyaring nilai di antara dua nilai batas tertentu, dan baris yang memiliki nilai yang sama dengan 
batas akan dimasukkan dalam hasil.

IN: Digunakan untuk menyaring baris di mana nilai kolom cocok dengan salah satu nilai dalam daftar nilai yang diberikan. 
Ini memeriksa kecocokan persis, dan jika nilai kolom cocok dengan salah satu nilai dalam daftar, baris tersebut akan dimasukkan 
dalam hasil.
*/

-- menampilkan semua data pada table "barang5" dengan kondisi "like"
-- yang dimana pada column "barang_name" like '%la%' yang akan menampilkan nilai substring
-- Penggunaan % sebelum dan setelah "la" menunjukkan bahwa "la" dapat muncul di mana saja dalam nilai kolom, 
-- termasuk pada awal atau akhir nilai tersebut
select * from barang5 where barang_name like '%la%'

/*
Perbedaan Penggunaan LIKE dengan %a, %a%, dan a%:

	- %a: Mengembalikan nilai yang diakhiri dengan "a". Misalnya, "la" atau "bla" akan cocok, tetapi "ab" tidak cocok.
	- %a%: Mengembalikan nilai yang mengandung "a" di mana pun dalam nilai tersebut. Misalnya, "lab" atau "bat" akan cocok.
	- a%: Mengembalikan nilai yang dimulai dengan "a". Misalnya, "apple" atau "ananas" akan cocok, tetapi "banana" tidak cocok 
	karena tidak dimulai dengan "a".

Penting untuk diingat bahwa penggunaan wildcard (%) pada kedua sisi substring memberikan fleksibilitas yang lebih besar dalam pencarian.
*/
