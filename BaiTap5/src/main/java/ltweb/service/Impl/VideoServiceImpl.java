package ltweb.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ltweb.entity.Video;
import ltweb.repository.VideoRepository;
import ltweb.service.VideoService;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    VideoRepository videoRepository;

    @Override
    public Video save(Video video) {
        return videoRepository.save(video);
    }

    @Override
    public List<Video> findAll() {
        return videoRepository.findAll();
    }

    @Override
    public List<Video> findByTitleContaining(String title) {
        return videoRepository.findByTitleContaining(title);
    }

    @Override
    public Video findById(Integer id) {
        Optional<Video> video = videoRepository.findById(id);
        return video.isPresent() ? video.get() : null;
    }

    @Override
    public void deleteById(Integer id) {
        videoRepository.deleteById(id);
    }
}