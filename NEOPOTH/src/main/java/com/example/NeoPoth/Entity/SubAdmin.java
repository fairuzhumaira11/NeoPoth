package com.example.NeoPoth.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
public class SubAdmin extends User {
    @Column(name = "institution_name", nullable = false, unique = true)
    private String institutionName;

    @Column(name = "institution_code", nullable = false, unique = true)
    private String institutionCode;

    @Column(name = "institution_address")
    private String institutionAddress;

    @Column(name = "total_students")
    private Integer totalStudents = 0;

}
