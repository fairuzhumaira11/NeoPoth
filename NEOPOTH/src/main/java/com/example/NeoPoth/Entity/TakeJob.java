package com.example.NeoPoth.Entity;

import com.example.NeoPoth.Enum.ApplyStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;


@Entity
@Data
public class TakeJob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "take_job_id")
    private Long takeJobId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private Student student;

    @Enumerated(EnumType.STRING)
    @Column(name = "apply_status")
    private ApplyStatus applyStatus = ApplyStatus.PENDING;

    @Column(name = "apply_date")
    private LocalDateTime applyDate;
}
