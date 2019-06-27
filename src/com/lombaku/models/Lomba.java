package com.lombaku.models;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import static javax.persistence.GenerationType.IDENTITY;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;


@Entity
@Table(name = "lomba")
public class Lomba implements java.io.Serializable {
    
    private int id;
    private String nama;
    private Date mulaiDaftar;
    private Date akhirDaftar;
    private Date mulaiLomba;
    private Date akhirLomba;
    private String deskripsi;    
    private User user;
    private Kategori kategori;
    private boolean isVerified;
    
    public Lomba() {
    	
    }
    
    public Lomba(String nama, Date mulaiDaftar, Date akhirDaftar, Date mulaiLomba, Date akhirLomba,
            String deskripsi, User user, Kategori kategori) {
        super();
        this.nama = nama;
        this.mulaiDaftar = mulaiDaftar;
        this.akhirDaftar = akhirDaftar;
        this.mulaiLomba = mulaiLomba;
        this.akhirLomba = akhirLomba;
        this.deskripsi = deskripsi;
        this.user = user;
        this.kategori = kategori;
    }
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    @NotBlank(message = "Tidak boleh kosong")
    @Column(name = "nama", nullable = false, length = 300)
    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    @NotNull(message = "Tidak boleh kosong")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "mulai_daftar", nullable = false)
    public Date getMulaiDaftar() {
        return mulaiDaftar;
    }

    public void setMulaiDaftar(Date mulaiDaftar) {
        this.mulaiDaftar = mulaiDaftar;
    }

    @NotNull(message = "Tidak boleh kosong")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "akhir_daftar", nullable = false)
    public Date getAkhirDaftar() {
        return akhirDaftar;
    }

    public void setAkhirDaftar(Date akhirDaftar) {
        this.akhirDaftar = akhirDaftar;
    }

    @NotNull(message = "Tidak boleh kosong")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "mulai_lomba", nullable = false)
    public Date getMulaiLomba() {
        return mulaiLomba;
    }

    public void setMulaiLomba(Date mulaiLomba) {
        this.mulaiLomba = mulaiLomba;
    }

    @NotNull(message = "Tidak boleh kosong")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "akhir_lomba", nullable = false)
    public Date getAkhirLomba() {
        return akhirLomba;
    }

    public void setAkhirLomba(Date akhirLomba) {
        this.akhirLomba = akhirLomba;
    }

    @NotBlank(message = "Tidak boleh kosong")
    @Column(name = "deskripsi", nullable = false, length = 2000)
    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    @ManyToOne
    @JoinColumn(name = "user")
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
	@Column(name = "is_verified", nullable = false)
	public boolean getIsVerified() {
		return this.isVerified;
	}
	
	public void setIsVerified(boolean isVerified) {
		this.isVerified = isVerified;
	}
	
	@ManyToOne
    @JoinColumn(name = "kategori")
    public Kategori getKategori() {
        return kategori;
    }

    public void setKategori(Kategori kategori) {
        this.kategori = kategori;
    }
    
}