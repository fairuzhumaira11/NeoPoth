package com.example.NeoPoth.Repository;

import com.example.NeoPoth.Entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StudentRepository extends JpaRepository<Student, Long> {
    Optional<Student> findByUniversityEmail(String universityEmail);
    Optional<Student> findByStudentId(String studentId);
    List<Student> findByInstitutionId(Long institutionId);
    List<Student> findByIsVerified(Boolean isVerified);
    List<Student> findByFirstNameContainingIgnoreCaseOrLastNameContainingIgnoreCase(String firstName, String lastName);
}
