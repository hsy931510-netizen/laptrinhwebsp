package vn.iotstar.service;

import java.util.List;

import org.springframework.data.domain.Sort;

import vn.iotstar.entity.category;

public interface ICategoryService {

	void deleteAll();

	long count();

	List<category> findAllById(Iterable<Long> ids);

	List<category> findAll();

	category findById(Long id);

	<S extends category> S save(S entity);

	void deleteById(Long id);

	List<category> findAll(Sort sort);

	List<category> search(String keyword);

}
