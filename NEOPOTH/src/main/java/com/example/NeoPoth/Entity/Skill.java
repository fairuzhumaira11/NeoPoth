package com.example.NeoPoth.Entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Skill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "skill_id")
    private Long skillId;

    @Column(name = "name", nullable = false, unique = true)
    private String name;
}
