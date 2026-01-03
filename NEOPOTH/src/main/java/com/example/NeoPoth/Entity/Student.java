package com.example.NeoPoth.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)//why used don't know
@Entity
@Data
public class Student extends User{
    @Column(name = "university_email", nullable = false, unique = true)
    private String universityEmail;

    @Column(name = "student_id", unique = true)
    private String studentId;

    @Column(name = "institution_id")
    private Long institutionId; // References SubAdmin's institution

    @Column(name = "is_verified")
    private Boolean isVerified = false;

    @Column(name = "total_earnings")
    private Double totalEarnings = 0.0;
}
