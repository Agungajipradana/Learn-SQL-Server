/*
menambahkan column pada sebuah tabel:

	alter table table_name
	add column_name type_data constraint
*/

-- mengecek table pembelian
sp_help pembelian

select * from pembelian

-- menambahkan column pada tabel pembelian
alter table pembelian
add total money null,
information varchar(100) collate sql_latin1_general_cp1_ci_as

/*
Pada SQL Server, klausa "COLLATE" digunakan untuk menentukan urutan penyusunan karakter (collation) yang akan diterapkan pada kolom, 
ekspresi, atau frasa query tertentu. Urutan penyusunan karakter mempengaruhi cara data diurutkan dan dibandingkan, 
serta bagaimana operasi pembandingan string dilakukan (apakah case-sensitive atau case-insensitive).

Dalam kasus spesifik ini, "COLLATE SQL_Latin1_General_CP1_CI_AS" digunakan untuk menetapkan urutan penyusunan karakter 
Latin1 General dengan case-insensitive. Berikut penjelasan dari setiap bagian:

1.SQL_Latin1_General_CP1_CI_AS:

	SQL_Latin1_General: Merujuk pada urutan penyusunan karakter yang digunakan. Ini adalah salah satu urutan penyusunan karakter standar 
	SQL Server yang mendukung karakter Latin.

	CP1: Merujuk pada Code Page 1, yang merupakan set karakter tertentu yang digunakan oleh sistem operasi atau database untuk mewakili 
	karakter tertentu. Code Page 1 umumnya sesuai dengan karakter Latin.

	CI_AS:

		CI: Case-Insensitive. Ini menunjukkan bahwa pengurutan dan perbandingan string akan diabaikan terhadap perbedaan huruf besar dan kecil. 
		Misalnya, 'a' dan 'A' dianggap sama.

		AS: Accent-Sensitive. Ini menunjukkan bahwa perbandingan string akan mempertimbangkan perbedaan aksen, 
		sehingga karakter dengan aksen dianggap berbeda. 
		
	Dengan menggunakan "COLLATE SQL_Latin1_General_CP1_CI_AS", Anda mengatur urutan penyusunan karakter untuk kolom tertentu 
	dalam tabel "pembelian" sehingga perbandingan string akan menjadi case-insensitive dan accent-sensitive sesuai dengan aturan 
	yang diberikan oleh urutan penyusunan karakter tersebut.

	Selain itu, beberapa contoh urutan penyusunan karakter (collation) lain yang umum digunakan di SQL Server meliputi:

	SQL_Latin1_General_CP1_CS_AS: Case-Sensitive dan Accent-Sensitive.
	SQL_Latin1_General_CP1_CS_AS_KI_WI: Case-Sensitive, Accent-Sensitive, Kana-Insensitive, dan Width-Insensitive.

	Anda dapat memilih urutan penyusunan karakter yang sesuai dengan kebutuhan aplikasi atau data yang sedang Anda kelola.
*/