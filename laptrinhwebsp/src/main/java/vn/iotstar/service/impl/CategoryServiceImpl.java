package vn.iotstar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.category;
import vn.iotstar.repository.CategoryRepository;
import vn.iotstar.service.ICategoryService;

@Service
public class CategoryServiceImpl implements ICategoryService{

	@Autowired
	CategoryRepository categoryRepository;

	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		this.categoryRepository = categoryRepository;
	}

	@Override
	public List<category> findAll(Sort sort) {
		return categoryRepository.findAll(sort);
	}

	@Override
	public <S extends category> S save(S entity) {
		return categoryRepository.save(entity);
	}

	@Override
	public List<category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public category findById(Long id) {
		return categoryRepository.findById(id).orElse(null);
	}

	@Override
	public void deleteById(Long id) {
		categoryRepository.deleteById(id);
	}

	@Override
	public List<category> findAllById(Iterable<Long> ids) {
		return categoryRepository.findAllById(ids);
	}

	@Override
	public long count() {
		return categoryRepository.count();
	}

	@Override
	public void deleteAll() {
		categoryRepository.deleteAll();
	}

	@Override
	public List<category> search(String keyword) {
		if (keyword == null || keyword.trim().isEmpty()) {
			return categoryRepository.findAll();
		}
		return categoryRepository.search(keyword.trim());
	}
}
