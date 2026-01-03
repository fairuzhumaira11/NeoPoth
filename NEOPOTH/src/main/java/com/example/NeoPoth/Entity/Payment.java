package com.example.NeoPoth.Entity;

import com.example.NeoPoth.Enum.PaymentMethod;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "payment_id")
    private Long paymentId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "job_id", nullable = false)
    private Job job;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payed_to_id", nullable = false)
    private Student payedTo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "payed_by_id", nullable = false)
    private Employer payedBy;

    @Column(name = "amount", nullable = false)
    private Double amount;

    @Enumerated(EnumType.STRING)
    @Column(name = "payment_method")
    private PaymentMethod paymentMethod;

    @Column(name = "transaction_id")
    private String transactionId;

    @Column(name = "status")
    private String status; // PENDING, COMPLETED, FAILED

    @Column(name = "created_at")
    private LocalDateTime createdAt;
}
