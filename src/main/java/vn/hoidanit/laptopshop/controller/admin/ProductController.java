package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {
    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(
            UploadService uploadService,
            ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> prs = this.productService.fetchProducts();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product product = this.productService.fetchProductById(id);
        model.addAttribute("product", product);
        model.addAttribute("id", id);
        return "admin/product/detail";

    }

    @GetMapping("/admin/product/create") // GET
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String createUserPage(Model model,
            @ModelAttribute("newProduct") @Valid Product hieuduong,
            BindingResult newUserBindingResult,
            @RequestParam("hieuduongFile") MultipartFile file) {

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        //
        String image = this.uploadService.handleSaveUploadFile(file, "product");

        hieuduong.setImage(image);

        this.productService.createProduct(hieuduong);
        return "redirect:/admin/product";
    }

    @GetMapping("admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("newProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("admin/product/update")
    public String postUpdateProduct(Model model,
            @ModelAttribute("newProduct") @Valid Product hieuduong,
            BindingResult newUserBindingResult,
            @RequestParam("hieuduongFile") MultipartFile file) {

        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>>>" + error.getField() + " - " + error.getDefaultMessage());
        }

        // validate
        if (newUserBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        Product currentProduct = this.productService.fetchProductById((hieuduong.getId()));
        if (currentProduct != null) {
            // update new image
            if (!file.isEmpty()) {
                String img = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(img);
            }

            currentProduct.setName(hieuduong.getName());
            currentProduct.setPrice(hieuduong.getPrice());
            currentProduct.setDetailDesc(hieuduong.getDetailDesc());
            currentProduct.setShortDesc(hieuduong.getShortDesc());
            currentProduct.setFactory(hieuduong.getFactory());
            currentProduct.setTarget(hieuduong.getTarget());
            currentProduct.setQuantity(hieuduong.getQuantity());

            this.productService.createProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product hieuduong) {
        this.productService.deleteAProduct(hieuduong.getId());
        return "redirect:/admin/product";
    }
}
