package vn.iotstar.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "video")
@Entity
public class video implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "VideoId")
    private String videoId;

    @Column(name = "Active")
    private boolean active;

    @Column(name = "Description", columnDefinition = "TEXT")
    private String description;

    @Column(name = "Poster")
    private String poster;

    @Column(name = "Title", columnDefinition = "VARCHAR(255) NOT NULL")
    private String title;

    @Column(name = "Views")
    private int views;

    // Kết nối many-to-one với Category
    @ManyToOne
    @JoinColumn(name = "CategoryId")
    private category category;
}