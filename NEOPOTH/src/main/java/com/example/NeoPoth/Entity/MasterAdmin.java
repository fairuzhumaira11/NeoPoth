package com.example.NeoPoth.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Entity
@Data
public class MasterAdmin extends User {
    @Column(name = "is_super_admin")
    private Boolean isSuperAdmin = true;

    @Column(name = "permission_level")
    private Integer permissionLevel = 10;

    @Column(name = "can_manage_sub_admins")
    private Boolean canManageSubAdmins = true;

    @Column(name = "can_manage_all_jobs")
    private Boolean canManageAllJobs = true;
}