package firstTry.models;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "images")
@Data
public class Images {
    @Id
    @GeneratedValue
    private Long id;
    private String imagePath;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User user;

}
