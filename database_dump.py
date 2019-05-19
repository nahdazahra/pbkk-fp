from random import randint
from datetime import date, timedelta

def main():
    # user
    nama = ['Btari','Aliya','Tsabitah','Ignatius','Dwiki','Iskandar','Kevin','Angga','Wijaya','Segara','Bhagas','Dagsapurwa','Imam','Rafii','Dzakwan','Joseph','Eric','Amadeo','Seloatmodjo','Zakiya','Azizah','Cahyaningtyas','Julius','Vincentius','Tanubrata','Mochamad','Haikal','Ghiffari','Patrick','Cipta','Winata','Achmad','Fikri','Adidharma','Bintang','Nuralamsyah','Karina','Soraya','Puspitasari','Wasilatul','Dewi','Ningrum','Alifiannisa','Alyahasna','Wighneswara','Atika','Rizki','Nurakhmah','Sherly','Rosa','Anggraeni','Arief','Prasetyo','Dwi','Prasetya','Armunanta','Hisam','Widi','Prayoga','Putri','Endah','Annas','Nuril','Iman','Muhammad','Yusuf','Mukharom','Yasinta','Yusniawati','Ivan','Indrakusuma','Abraham','Wong','Iqbal','Imani','Atfan','Raja','Permata','Boy','Mangatur','Simarmata','Paksi','Ario','Pamungkas','Fadly','Hasan','Najatul','Muslim','Dinatra','Bima','Satria','Ramadhan','Indira','Nursyamsina','Hazimi','Bayu','Novaldi','Novan','Ardhana','Ida','Bagus','Rai','Widnyana','Claus','Peter','Christo','Hutabarat','Affan','Ahsanul','Habib','Tria','Nur','Aisyah','Amini','Timothyus','Tanner','Leonita','Megasarah','Ruth','Sitompul','Philip','Antoni','Siahaan','Chaniyah','Zulfa','Mukhlishah','Fandy','Kuncoro','Adianto','Elkana','Hans','Widersen']
    id_user=3
    jumlah_peserta=0
    for i in nama:
        id_user+=1
        jumlah_peserta+=1
        print('INSERT INTO `users` (id,name,email,password,is_admin) VALUES ("'+str(id_user)+'","'+i+'","'+i.lower()+'@lombaku.com","123","0");')

    # lomba
    nama_lomba = ['Schematics', 'Gemastik', 'IToday', 'Arkavidia', 'COMPFEST', 'Cyber Jawara', 'Cyber Defence Competition', 'IT Fest']
    id_lomba=0
    id_peserta=0
    jml_peserta = jumlah_peserta
    deskripsi = 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus'
    for i in nama_lomba:
        id_lomba+=1
        is_verified = randint(0, 1)
        user_pembuat = randint(4, jml_peserta)
        start_dt = date.today().replace(day=1, month=1).toordinal()
        end_dt = date.today().toordinal()
        mulai_daftar = date.fromordinal(randint(start_dt, end_dt))
        akhir_daftar = mulai_daftar + timedelta(days=14)
        mulai_lomba = akhir_daftar + timedelta(days=2)
        akhir_lomba = mulai_lomba + timedelta(days=30)
        print('INSERT INTO `lomba` (id,nama,mulai_daftar,akhir_daftar,mulai_lomba,akhir_lomba,deskripsi,user,is_verified) VALUES ("'+str(id_lomba)+'","'+i+'","'+str(mulai_daftar)+'","'+str(akhir_daftar)+'","'+str(mulai_lomba)+'","'+str(akhir_lomba)+'","'+deskripsi+'","'+str(user_pembuat)+'","'+str(is_verified)+'");')
        # peserta
        for i in range(1, 10):
            id_peserta+=1
            tanggal_daftar = date.fromordinal(randint(mulai_daftar.toordinal(), akhir_daftar.toordinal()))
            peserta = randint(4, jml_peserta)
            print('INSERT INTO `peserta` (id,user,lomba,tanggal_daftar) VALUES ("'+str(id_peserta)+'","'+str(peserta)+'","'+str(id_lomba)+'","'+str(tanggal_daftar)+'");')

if __name__ == "__main__":
    # clear table lomba, peserta, users
    print('DELETE FROM lombaku.lomba;')
    print('DELETE FROM lombaku.peserta;')
    print("DELETE FROM lombaku.users WHERE name != 'Admin';")
    main()