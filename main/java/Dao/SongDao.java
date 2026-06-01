package Dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import Model.Song;
import utils.JpaUtil;

public class SongDao {

    public List<Song> findAll() {

        EntityManager em = JpaUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT s FROM Song s",
                    Song.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    public List<Song> search(String keyword) {

        EntityManager em = JpaUtil.getEntityManager();

        try {

            TypedQuery<Song> query =
                    em.createQuery(
                            "SELECT s FROM Song s " +
                            "WHERE LOWER(s.title) LIKE LOWER(:kw) " +
                            "OR LOWER(s.artist) LIKE LOWER(:kw) " +
                            "OR LOWER(s.genre) LIKE LOWER(:kw)",
                            Song.class);

            query.setParameter("kw", "%" + keyword + "%");

            return query.getResultList();

        } finally {
            em.close();
        }
    }
}