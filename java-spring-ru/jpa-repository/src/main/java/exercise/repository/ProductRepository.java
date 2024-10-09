package exercise.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import exercise.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // BEGIN
    // Метод для поиска товаров по цене, если указаны обе границы диапазона
    List<Product> findByPriceBetween(Integer min, Integer max, Sort sort);
    // END
}
