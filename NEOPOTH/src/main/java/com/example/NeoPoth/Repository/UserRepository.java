package com.example.NeoPoth.Repository;

import com.example.NeoPoth.Entity.User;
import com.example.NeoPoth.Enum.UserType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
    Optional<User> findByEmail(String email);
    List<User> findByUserType(UserType userType);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    Optional<User> findByNidCardNumber(String nidCardNumber);
}
