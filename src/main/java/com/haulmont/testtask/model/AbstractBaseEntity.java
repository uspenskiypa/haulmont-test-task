package com.haulmont.testtask.model;

import org.hibernate.Hibernate;
import javax.persistence.*;
import java.util.Objects;
import java.util.UUID;

@MappedSuperclass
@Access(AccessType.FIELD)
public abstract class AbstractBaseEntity {
    @Id
    @GeneratedValue
    @Column(columnDefinition = "BINARY(16)")
    protected UUID id;

    protected AbstractBaseEntity() {
    }

    protected AbstractBaseEntity(UUID id) {
        this.id = id;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + ":" + id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || !getClass().equals(Hibernate.getClass(o))) {
            return false;
        }
        AbstractBaseEntity that = (AbstractBaseEntity) o;
        return id != null && id.equals(that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
