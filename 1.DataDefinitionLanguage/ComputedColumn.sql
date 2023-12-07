/*
Kolom terhitung (computed column) pada SQL Server adalah sebuah kolom yang nilai-nilainya dihitung berdasarkan ekspresi atau 
formula yang menggunakan nilai dari satu atau beberapa kolom lain dalam tabel. Nilai kolom terhitung ini tidak disimpan secara fisik di dalam tabel;
sebaliknya, nilai-nilai tersebut dihitung secara dinamis ketika diperlukan pada saat query dieksekusi.

Berikut adalah sintaksis dasar untuk membuat kolom terhitung:

CREATE TABLE nama_tabel (
    kolom1 TipeData1,
    kolom2 TipeData2,
    kolom_terhitung AS EkspresiTerhitung
);

Contoh penggunaan:

CREATE TABLE Produk (
    ID INT PRIMARY KEY,
    Harga DECIMAL(10, 2),
    Jumlah INT,
    TotalHarga AS Harga * Jumlah
);

Pada contoh di atas, kolom TotalHarga adalah kolom terhitung yang dihasilkan dari perkalian nilai kolom Harga dengan nilai kolom Jumlah. 
Saat Anda melakukan query yang meminta nilai TotalHarga, SQL Server akan menghitung nilai tersebut secara otomatis berdasarkan ekspresi yang 
didefinisikan.
*/

-- membuat table person
create table person(
	person_id int identity not null,
	first_name varchar(50) not null,
	middle_name varchar(50),
	last_name varchar(50),
	birth_date date
)

select * from person 

-- memasukan data ke dalam tabel person
insert into person(first_name, middle_name, last_name, birth_date)values('budi', '', 'rusdi', '1995-02-23')
insert into person(first_name, middle_name, last_name, birth_date)values('joko', '', 'anwar', '1994-02-23')

-- menggabungkan character menggunakan concat pada column "first_name", "middle_name", "last_name" menjadi satu column yaitu "fullname"
select concat(first_name, ' ', middle_name, ' ', last_name) as fullname, birth_date from person

-- menambahkan computed column yang disebut "full_name" pada tabel "person.
alter table person
add full_name as (concat(first_name, ' ', middle_name, ' ', last_name)) persisted

/*
Penambahan kata kunci "PERSISTED" menunjukkan bahwa nilai kolom terhitung ini akan disimpan secara fisik di dalam tabel, 
yang berarti hasil konkatenasi akan dihitung saat data disisipkan atau diperbarui dan akan disimpan di dalam tabel.
*/

-- menampilkan data pada column "full_name" dan "birth_date" pada tabel person
select full_name, birth_date from person

-- menampilkan data pada column "full_name", "birth_date", dan age yang dihitung dari fungsi "datediff(year, birth_date, getdate())"
select full_name, birth_date, datediff(year, birth_date, getdate()) as age from person

-- menambahkan computed column yang disebut "full_name" pada tabel "person.
alter table person
add age as (datediff(year, birth_date, getdate())) persisted

/*
pada add age diatas, ketika dijalankan terdapat error:
Computed column 'age' in table 'person' cannot be persisted because the column is non-deterministic.
karna penggunaan "persisted" hanya untuk data yang bersifat tetap. 
Dan pada column "age" diatas menggunakan getdate() yang bersifat tidak tetap
*/

-- menambahkan computed column yang disebut "full_name" pada tabel "person.
alter table person
add age as (datediff(year, birth_date, getdate())) 

-- menampilkan data pada column "full_name", "birth_date", dan "age" pada tabel person
select full_name, birth_date, age from person