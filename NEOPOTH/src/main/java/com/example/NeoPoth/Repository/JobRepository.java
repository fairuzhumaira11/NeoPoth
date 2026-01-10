package com.example.NeoPoth.Repository;

import com.example.NeoPoth.Entity.Job;
import com.example.NeoPoth.Enum.JobStatus;
import com.example.NeoPoth.Enum.JobType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    List<Job> findByJobStatus(JobStatus status);
    List<Job> findByJobType(JobType type);
    List<Job> findByCategoryCategoryId(Long categoryId);
    List<Job> findByLocationContainingIgnoreCase(String location);
    List<Job> findBySalaryBetween(Double minSalary, Double maxSalary);
    List<Job> findByJobTitleContainingIgnoreCase(String title);

    @Query("SELECT j FROM Job j WHERE j.jobTitle LIKE %:keyword% OR j.jobDescription LIKE %:keyword%")
    List<Job> searchJobsByKeyword(@Param("keyword") String keyword);

    List<Job> findByJobStatusAndJobType(JobStatus status, JobType type);

    @Query("SELECT j FROM Job j ORDER BY j.salary ASC")
    List<Job> findAllOrderBySalaryAsc();

    @Query("SELECT j FROM Job j ORDER BY j.salary DESC")
    List<Job> findAllOrderBySalaryDesc();
}
