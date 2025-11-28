package ltweb.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import ltweb.entity.Video;

public interface VideoRepository extends JpaRepository<Video, Integer> {
    // Tìm kiếm video theo tiêu đề
    List<Video> findByTitleContaining(String title);
    
    // Tìm tất cả video đang hoạt động
    List<Video> findByActiveTrue();
}