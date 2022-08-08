package firstTry.models;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "game")
@Data
public class Game {
    @Id
    @GeneratedValue
    private Long id;
    private LocalDate date;
    private LocalTime time;
    private int selfRate;
    private int teamRate;
    private String result;
    private int enjoyment;
    private String comment;
    private String hero;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
    @JoinColumn
    private User user;

    @PrePersist
    private void dateTimeOfCreate(){
        date = LocalDate.now();
        time = LocalTime.now();
    }
    public String outputValue(int value) {
        switch (value) {
            case 1:
                return "Ужасно";
            case 2:
                return "Плохо";
            case 3:
                return "Нормально";
            case 4:
                return "Хорошо";
            case 5:
                return "Отлично";
        }
        return "Проверьте базу данных";
    }
}
