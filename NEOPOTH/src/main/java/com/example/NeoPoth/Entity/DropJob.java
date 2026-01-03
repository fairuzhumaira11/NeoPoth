package com.example.NeoPoth.Entity;

import com.example.NeoPoth.Enum.ApplyStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
@Entity
@Data
public class DropJob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "drop_job_id")
    private Long dropJobId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private Employer employer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sub_admin_id")
    private SubAdmin subAdmin;

    @Enumerated(EnumType.STRING)
    @Column(name = "apply_status")
    private ApplyStatus applyStatus = ApplyStatus.OPEN;

    @Column(name = "dropping_date")
    private LocalDateTime droppingDate;
}
