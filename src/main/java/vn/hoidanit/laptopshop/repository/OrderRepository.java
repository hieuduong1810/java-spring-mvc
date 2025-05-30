package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query("SELECT o FROM Order o WHERE o.user.id = :userId ORDER BY o.id DESC")
    List<Order> findByUserId(@Param("userId") long userId);

}
