package vn.iotstar.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.category;
@Repository
public interface CategoryRepository extends JpaRepository<category,Long> {

    @Query("SELECT c FROM category c WHERE c.categoryname LIKE %?1% OR c.categorycode LIKE %?1%")
    List<category> search(String keyword);
}
