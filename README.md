# TimeExcelindo PHP Rest API
Framework PHP Rest API ini dikembangkan,untuk sebagai web service penghubung antara data pemeriksaan laboratorium dari Sistem Informasi Rumah Sakit dengan Laboratorium Information System

# Tahapan Instalasi
1. buat database dihost lokal
2. import dump database mysql dengan file lis_api.sql
3. download atau clone source lis_api dari github dan letakan pada folder htdocs Web server apache (bisa xampp atau yang lainnya)
3. ubah konfigurasi pada file index.php pada line
=================================================
'database_name' => '<nama database>',
	/** MySQL hostname */
	'database_host' => '<nama host>',
	/** MySQL database username */
	'database_user' => '<user database',
	/** MySQL database password */ 
	'database_password' => '<password user database>',
================================================

# Endpoint pada API
1. Get Order
   endpoint get order adalah mendapatkan data pasien yang dirujuk ke laboratorium
   url : http://localhost/lis_api/api/v1/order
   output :
        {
            "success": true,
            "data": [
                {
                    "RegistrationNo": "RG20190909000001",
                    "MedicalRecordNo": "9999999",
                    "OrderControl": "1",
                    "AlternatePatientID": "00000000",
                    "PatientName": "Teguh Susanto",
                    "PatientAddress": "Jl. Kaliurang Km 12 No 123 Ngagglik Sleman",
                    "PatientType": "IN",
                    "BirthDate": "1978-04-23",
                    "Sex": "1",
                    "HISOrderNumber": "TR20190909000001",
                    "LabNumber": "LAB20190909000001",
                    "OrderDate": "2019-09-09 00:00:00",
                    "UnitCode": "2",
                    "UnitName": "Poliklinik Penyakit Dalam",
                    "ClinicianCode": "23",
                    "ClinicianName": "dr. Indra Hasibuan SPPD",
                    "RoomNo": "12",
                    "Priority": "1",
                    "PaymentStatus": "0",
                    "Comment": "",
                    "VisitNo": "1"
                },
                {
                    "RegistrationNo": "RG20190910000002",
                    "MedicalRecordNo": "000002",
                    "OrderControl": "1",
                    "AlternatePatientID": "",
                    "PatientName": "Gunawan Cisco Putra",
                    "PatientAddress": "Jl. Kemangi No 124 Condong Catur,Depok Sleman",
                    "PatientType": "1",
                    "BirthDate": "1980-08-09",
                    "Sex": "1",
                    "HISOrderNumber": "TR20190909000002",
                    "LabNumber": "LAB20190909000002",
                    "OrderDate": "2019-09-10 00:00:00",
                    "UnitCode": "02",
                    "UnitName": "Poliklinik Umum",
                    "ClinicianCode": "45",
                    "ClinicianName": "dr Dody",
                    "RoomNo": "1",
                    "Priority": "1",
                    "PaymentStatus": "0",
                    "Comment": "",
                    "VisitNo": "2"
                }
            ],
            "count": 2
        }
    data yang dibutuhkan dalam LIS antara lain
                    "RegistrationNo": Berisi Nomor atau kombinasi nomor dan karakter Uniq dari SIMRS yang diberikan setiap kunjungan/episode pasien dengan panjang 50 karakter
                    "MedicalRecordNo": Berisi nomor atau kombinasi nomor dan karakter uniq dari SIMRS yang diberikan sebagai tiap personal pasien
                    "OrderControl": Berisi panjang 2 karakter dengan isi antara lain NW : New (Baru),RP:Replace (Merubah),CA:Cancel (Membatalkan)
                    "AlternatePatientID": Berisi Nomor atau kombinasi nomor dan karakter Uniq dari SIMRS yang diberikan setiap kunjungan/episode pasien yang lain (Opsional) dengan panjang 50 karakter
                    "PatientName": Berisi Karakter dengan panjang 100 karakter yang diisikan nama pasien
                    "PatientAddress": Berisi Karakter dengan panjang 200 karakter yang diisikan alamat pasien
                    "PatientType": Berisi Karakter dengan panjang 2 karakter yang diisikan IP:Pasien Rawat Inap,OP:Pasien Rawat Jalan	
                    "BirthDate": Berisi tanggal lahir pasien dengan format tanggal dengan struktur format tanggal YYYY-MM-DD
                    "Sex": Berisi integer yang diisikan 1:Laki-Laki ,2:Perempuan, 0:Tidak Tahu
                    "HISOrderNumber": Berisi Nomor atau kombinasi nomor dan karakter Uniq dari SIMRS yang diberikan setiap kunjungan pemeriksaan pasien ke unit laboratorium dengan panjang 50 karakter
                    "LabNumber": Berisi Nomor atau kombinasi nomor dan karakter Uniq dari SIMRS yang diberikan setiap kunjungan pemeriksaan pasien ke unit laboratorium yang lain dengan panjang 50 karakter
                    "OrderDate": Berisi tanggal order pemeriksaan dengan format tanggal dengan struktur format tanggal YYYY-MM-DD
                    "UnitCode": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan kode Unit Layanan Medis di Rumah Sakit dengan panjang 5 karakter
                    "UnitName": Berisi karakter yang berisikan nama Unit Layanan Medis di Rumah Sakit dengan panjang 100 karakter
                    "ClinicianCode": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan kode Petugas Medis di Rumah Sakit dengan panjang 5 karakter
                    "ClinicianName": Berisi karakter yang berisikan nama Petugas Medis di Rumah Sakit dengan panjang 100 karakter
                    "RoomNo": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan nomor ruang di Rumah Sakit dengan panjang 6 karakter
                    "Priority": Berisi Karakter dengan panjang 1 karakter yang diisikan U:Urgent/Cito,R:Routine
                    "PaymentStatus": berisi integer dengan isian 0:belum bayar,9:lunas (custom nilai 2 sd 8)
                    "Comment": berisikan karakter dengan berisikan keterangan dan panjang 255 karakter
                    "VisitNo": berisi integer dengan isian jumlah kunjungan pasien ke rumah sakit

2. Get Item
   endpoint get Item adalah mendapatkan data master Item Pemeriksaan yang ada di SIMRS
   url : http://localhost/lis_api/api/v1/items
   output :
        {
            "success": true,
            "data": [
                {
                    "ID": "00001",
                    "Name": "HEMATOLOGI",
                    "Parent": null,
                    "IsParent": "1",
                    "IsChild": "0"
                },
                {
                    "ID": "00002",
                    "Name": "Darah Lengkap",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "0"
                },
                {
                    "ID": "00003",
                    "Name": "Darah Rutin",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "0"
                },
                {
                    "ID": "00004",
                    "Name": "Hemoglobin",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "1",
                    "IsChild": "1"
                },
                {
                    "ID": "00005",
                    "Name": "Hitung jumlah sel",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "1",
                    "IsChild": "0"
                },
                {
                    "ID": "00006",
                    "Name": "Leukosit",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "1"
                },
                {
                    "ID": "00007",
                    "Name": "Eritrosit",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "1"
                },
                {
                    "ID": "00008",
                    "Name": "Trombosit",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "1"
                },
                {
                    "ID": "00009",
                    "Name": "Eosinofil",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "1"
                },
                {
                    "ID": "00010",
                    "Name": "Retikulosit",
                    "Parent": "HEMATOLOGI",
                    "IsParent": "0",
                    "IsChild": "1"
                }
            ],
            "count": 10
        }
    data yang dibutuhkan dalam LIS antara lain
                   "ID": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan kode item Pemeriksaan Laboratorium di Rumah Sakit dengan panjang 5 karakter
                    "Name": Berisi karakter yang berisikan nama item Pemeriksaan Laboratorium di Rumah Sakit dengan panjang 100 karakter
                    "Parent": Berisi karakter yang berisikan group nama item Pemeriksaan Laboratorium di Rumah Sakit dengan panjang 100 karakter
                    "IsParent": berisikan integer yang dengan nilai 1:merupakan group atau parent,0:bukan group atau parent
                    "IsChild": berisikan integer yang dengan nilai 1:merupakan child,0:bukan child


3. Get Sub Item
   endpoint get Item adalah mendapatkan data master Sub Item Pemeriksaan yang ada di SIMRS
   url : http://localhost/lis_api/api/v1/subitems
   output :
        {
            "success": true,
            "data": [
                {
                    "IDParent": "00002",
                    "Parent": "Darah Lengkap",
                    "IDChild": "00004",
                    "Child": "Hemoglobin"
                },
                {
                    "IDParent": "00002",
                    "Parent": "Darah Lengkap",
                    "IDChild": "00006",
                    "Child": "Leukosit"
                },
                {
                    "IDParent": "00002",
                    "Parent": "Darah Lengkap",
                    "IDChild": "00007",
                    "Child": "Eritrosit"
                },
                {
                    "IDParent": "00002",
                    "Parent": "Darah Lengkap",
                    "IDChild": "00008",
                    "Child": "Trombosit"
                }
            ],
            "count": 4
        }
    data yang dibutuhkan dalam LIS antara lain
                   "IDParent": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan kode item Pemeriksaan Parent Laboratorium di Rumah Sakit dengan panjang 5 karakter
                    "Parent": Berisi karakter yang berisikan group nama item Pemeriksaan Laboratorium di Rumah Sakit dengan panjang 100 karakter
                    "IDChild": Berisi Nomor atau kombinasi nomor dan karakter Uniq berisikan kode item Pemeriksaan Child Laboratorium di Rumah Sakit dengan panjang 5 karakter
                    "Child": Berisi karakter yang berisikan Child nama item Pemeriksaan Laboratorium di Rumah Sakit dengan panjang 100 karakter






"# timeexcelindo_api_lis" 
