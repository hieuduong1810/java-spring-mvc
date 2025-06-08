package vn.hoidanit.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.repository.OrderDetailRepository;
import vn.hoidanit.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailService;

    public OrderService(OrderRepository orderRepository,
            OrderDetailRepository orderDetailService) {
        this.orderRepository = orderRepository;
        this.orderDetailService = orderDetailService;
    }

    public Page<Order> fetchOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void deleteAOrder(long id) {
        Optional<Order> orderOpt = this.orderRepository.findById(id);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            // Delete all order details associated with this order
            this.orderDetailService.deleteAll(order.getOrder_detail());
        }

        this.orderRepository.deleteById(id);
    }

    public void updateAOrder(Order order) {
        Optional<Order> orderOpt = this.orderRepository.findById(order.getId());
        if (orderOpt.isPresent()) {
            Order currentOrder = orderOpt.get();
            // Update fields as necessary
            currentOrder.setStatus(order.getStatus());

            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrdersByUserId(long userId) {
        return orderRepository.findByUserId(userId);
    }
}
