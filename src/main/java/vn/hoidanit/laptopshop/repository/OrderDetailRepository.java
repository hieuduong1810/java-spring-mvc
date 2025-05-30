package vn.hoidanit.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.OrderDetail;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    // You can define custom query methods here if needed
    // For example:
    // List<OrderDetail> findByOrderId(Long orderId);

}
