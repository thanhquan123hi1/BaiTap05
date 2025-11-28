package ltweb.service;

import java.util.List;

import ltweb.entity.Video;

public interface VideoService {

	void deleteById(Integer id);

	Video findById(Integer id);

	List<Video> findByTitleContaining(String title);

	List<Video> findAll();

	Video save(Video video);

}
