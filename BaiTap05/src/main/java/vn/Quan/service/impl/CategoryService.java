package vn.Quan.service.impl;

import java.util.List;

import vn.Quan.entity.CategoryEntity;
import vn.Quan.repository.ICategoryRepository;
import vn.Quan.repository.impl.CategoryRepository;
import vn.Quan.service.ICategoryService;

public class CategoryService implements ICategoryService {

    private ICategoryRepository categoryRepo = new CategoryRepository();

    @Override
    public void create(CategoryEntity cate) throws Exception {

        if (cate.getCategoryName() == null || cate.getCategoryName().isEmpty()) {
            throw new Exception("Tên category không được bỏ trống");
        }

        if (cate.getUser() == null) {
            throw new Exception("Category bắt buộc phải thuộc một User!");
        }

        List<CategoryEntity> list = categoryRepo.findByUser(cate.getUser().getUsername());
        for (CategoryEntity c : list) {
            if (c.getCategoryName().equalsIgnoreCase(cate.getCategoryName())) {
                throw new Exception("Category này đã tồn tại!");
            }
        }

        categoryRepo.create(cate);
    }

    @Override
    public void update(CategoryEntity cate) throws Exception {

        CategoryEntity old = categoryRepo.findById(cate.getCategoryId());

        if (old == null) {
            throw new Exception("Category không tồn tại!");
        }

        if (cate.getCategoryName() == null || cate.getCategoryName().isEmpty()) {
            throw new Exception("Tên category không được bỏ trống");
        }

        List<CategoryEntity> list = categoryRepo.findByUser(old.getUser().getUsername());
        for (CategoryEntity c : list) {
            if (c.getCategoryId() != cate.getCategoryId() &&
                c.getCategoryName().equalsIgnoreCase(cate.getCategoryName())) {
                throw new Exception("Category này đã tồn tại!");
            }
        }

        cate.setUser(old.getUser());

        categoryRepo.update(cate);
    }

    @Override
    public void delete(int cateId) throws Exception {

        CategoryEntity cate = categoryRepo.findById(cateId);

        if (cate == null) {
            throw new Exception("Category không tồn tại!");
        }

        if (categoryRepo.hasVideos(cateId)) {
            throw new Exception("Không thể xóa category vì tồn tại video!");
        }

        categoryRepo.delete(cateId);
    }

    @Override
    public void deleteByAdmin(int cateId) throws Exception {

        CategoryEntity cate = categoryRepo.findById(cateId);

        if (cate == null) {
            throw new Exception("Category không tồn tại!");
        }

        if (categoryRepo.hasVideos(cateId)) {
            throw new Exception("Không thể xóa category vì tồn tại video!");
        }

        categoryRepo.delete(cateId);
    }

    @Override
    public CategoryEntity findById(int id) {
        return categoryRepo.findById(id);
    }

    @Override
    public List<CategoryEntity> findAll() {
        return categoryRepo.findAll();
    }

    @Override
    public List<CategoryEntity> findByUser(String username) {
        return categoryRepo.findByUser(username);
    }
}
