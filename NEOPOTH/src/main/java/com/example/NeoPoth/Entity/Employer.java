package com.example.NeoPoth.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
@Entity
public class Employer extends User {

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "total_posted_jobs")
    private Integer totalPostedJobs = 0;

    @Column(name = "total_hired_students")
    private Integer totalHiredStudents = 0;
}