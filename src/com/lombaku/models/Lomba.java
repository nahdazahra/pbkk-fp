package com.lombaku.models;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import static javax.persistence.GenerationType.IDENTITY;

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
    private boolean isVerified;
    
    public Lomba() {
    	
    }

    public Lomba(String nama, Date mulaiDaftar, Date akhirDaftar, Date mulaiLomba, Date akhirLomba,
            String deskripsi, User user) {
        super();
        this.nama = nama;
        this.mulaiDaftar = mulaiDaftar;
        this.akhirDaftar = akhirDaftar;
        this.mulaiLomba = mulaiLomba;
        this.akhirLomba = akhirLomba;
        this.deskripsi = deskripsi;
        this.user = user;
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

    @Column(name = "nama", nullable = false, length = 300)
    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    @Column(name = "mulai_daftar", nullable = false)
    public Date getMulaiDaftar() {
        return mulaiDaftar;
    }

    public void setMulaiDaftar(Date mulaiDaftar) {
        this.mulaiDaftar = mulaiDaftar;
    }

    @Column(name = "akhir_daftar", nullable = false)
    public Date getAkhirDaftar() {
        return akhirDaftar;
    }

    public void setAkhirDaftar(Date akhirDaftar) {
        this.akhirDaftar = akhirDaftar;
    }

    @Column(name = "mulai_lomba", nullable = false)
    public Date getMulaiLomba() {
        return mulaiLomba;
    }

    public void setMulaiLomba(Date mulaiLomba) {
        this.mulaiLomba = mulaiLomba;
    }

    @Column(name = "akhir_lomba", nullable = false)
    public Date getAkhirLomba() {
        return akhirLomba;
    }

    public void setAkhirLomba(Date akhirLomba) {
        this.akhirLomba = akhirLomba;
    }

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
    
}