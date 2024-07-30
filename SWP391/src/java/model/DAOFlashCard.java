package model;

import entity.FlashCard;
import entity.Quiz;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class DAOFlashCard extends DBConnect {

    public ArrayList<FlashCard> getTop6NewestFlashCard() {
        ArrayList<FlashCard> flashcard = new ArrayList<>();
        String sql = "  SELECT TOP (6)\n"
                + "  f.flashcard_id,f.question,f.answer,f.create_at,q.course_id\n"
                + "  FROM flashcard f inner join Quiz q \n"
                + "  on f.flashcard_id = q.flashcard_id\n"
                + "  ORDER BY create_at DESC, NEWID();";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                flashcard.add(new FlashCard(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            return null;
        }
        return flashcard;
    }

    public boolean checkDuplicate(String question, String answer, String image, String flashcard_id) {
        String sql = "SELECT COUNT(*) AS count FROM flashcard WHERE question = ? AND answer = ? AND image = ? AND flashcard_id <> ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, answer);
            ps.setString(3, image);
            ps.setString(4, flashcard_id); // Đảm bảo loại trừ flashcard hiện tại trong trường hợp cập nhật

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0; // Trả về true nếu có bản ghi trùng lặp, ngược lại trả về false
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false; // Mặc định trả về false nếu có lỗi xảy ra
    }

    public int updateFlashCard(String question, String answer, String image, String flashcard_id) {
        String sql = "    UPDATE flashcard \n"
                + "  Set question = ?, answer = ? , image = ?\n"
                + "  where flashcard_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, answer);
            ps.setString(3, image);
            ps.setString(4, flashcard_id);
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public ArrayList<FlashCard> getQuizzByCouseID(int course_id) {
        ArrayList<FlashCard> course = new ArrayList<>();
        String sql = "  select q.quiz_id,f.flashcard_id,f.question,f.answer,f.create_at,f.update_at\n"
                + "  from Course c inner join Quiz q \n"
                + "  on c.course_id = q.course_id \n"
                + "  inner join flashcard f \n"
                + "  on q.flashcard_id = f.flashcard_id\n"
                + "  where c.course_id = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, course_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                course.add(new FlashCard(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return course;
    }

    public Vector<FlashCard> getAllFlashCards() {
        String sql = "select * from flashcard";
        Vector<FlashCard> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public Vector<FlashCard> getAllFlashCardsByCategoryId(int categoryId) {
        String sql = "select * from flashcard where category_id = ?";
        Vector<FlashCard> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public FlashCard getFlashCardByID(int flashcard_id) {
        String sql = "select * from flashcard where flashcard_id = ?";
        FlashCard flashcard = new FlashCard();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                flashcard = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }
        return flashcard;
    }

    public Vector<FlashCard> getFlashCardInCourse(Vector<Quiz> quizzes) {
        Vector<FlashCard> vector = new Vector<>();
        for (Quiz quiz : quizzes) {
            try {
                String sql = "select * from flashcard where flashcard_id = ?";
                PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ps.setInt(1, quiz.getFlashcard_id());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
                }
            } catch (Exception e) {
                return null;
            }
        }
        return vector;
    }

    public FlashCard getFlashCardByQuestionName(String question) {
        FlashCard fl = null;
        try {
            String sql = "select * from flashcard where question = ? ";
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, question);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fl = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }

        return fl;
    }

    public Vector<FlashCard> getFlashCardByQuestionsNameAndCategory(String question, int categoryId) {
        Vector<FlashCard> vector = new Vector<>();
        try {
            String sql = "select * from flashcard where question like N'%" + question + "%' and category_id=?";
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }

        return vector;
    }

    public FlashCard getFlashCardByQuestionNameAndCategory(String question, int categoryId) {
        FlashCard fc = null;
        try {
            String sql = "select * from flashcard where question = N'" + question + "' and category_id=?";
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                fc = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }

        return fc;
    }

    public Vector<FlashCard> getFlashCardByRandomNumber(int random, int categoryId, String notIn) {
        String sql = "";
        if (notIn != null && notIn.length() == 0) {
            sql = "select top " + random + " * from flashcard where category_id = ? order by NEWID()";
        } else {
            sql = "select top " + random + " * from flashcard where category_id = ? and flashcard_id not in " + notIn + " order by NEWID()";
        }
        Vector<FlashCard> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }

        return vector;
    }

    public int insertFlashCardsByList(Vector<FlashCard> vector) {
        String sql = "insert into flashcard(question,answer,create_at,update_at,active,Category_id, image)\n"
                + "values(?,?,?,?,?,?,?)";
        int n = 0;
        int i = 0;
        try {
            for (FlashCard fl : vector) {
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, fl.getQuestion());
                ps.setString(2, fl.getAnswer());
                ps.setString(3, java.time.LocalDate.now().toString());
                ps.setString(4, java.time.LocalDate.now().toString());
                ps.setInt(5, 1);
                ps.setInt(6, fl.getCategory_id());
                ps.setString(7, fl.getImage());
                i = ps.executeUpdate();
            }
            n++;
        } catch (Exception e) {
        }

        return n;
    }

    public Vector<FlashCard> getFlashCardsByQuestion(String question) {
        String sql = "select * from [flashcard] where question like N'%" + question + "%'";
        Vector<FlashCard> vector = new Vector<>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                vector.add(new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            return null;
        }
        return vector;
    }

    public Vector<FlashCard> getFlashCardsSortedByNewestCreated() {
        Vector<FlashCard> flashcards = new Vector<>();
        String sql = "SELECT * FROM flashcard ORDER BY create_at DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FlashCard flashcard = new FlashCard();
                flashcard.setFlashcard_id(rs.getInt("flashcard_id"));
                flashcard.setQuestion(rs.getString("question"));
                flashcard.setAnswer(rs.getString("answer"));
                flashcard.setCreate_at(rs.getString("create_at"));
                flashcard.setUpdate_at(rs.getString("update_at"));
                flashcard.setActive(rs.getInt("active"));
                flashcard.setCategory_id(rs.getInt("Category_id"));
                flashcard.setImage(rs.getString("image"));
                flashcards.add(flashcard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flashcards;
    }

    public Vector<FlashCard> getFlashCardsSortedByOldestCreated() {
        Vector<FlashCard> flashcards = new Vector<>();
        String sql = "SELECT * FROM flashcard ORDER BY create_at ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FlashCard flashcard = new FlashCard();
                flashcard.setFlashcard_id(rs.getInt("flashcard_id"));
                flashcard.setQuestion(rs.getString("question"));
                flashcard.setAnswer(rs.getString("answer"));
                flashcard.setCreate_at(rs.getString("create_at"));
                flashcard.setUpdate_at(rs.getString("update_at"));
                flashcard.setActive(rs.getInt("active"));
                flashcard.setCategory_id(rs.getInt("Category_id"));
                flashcard.setImage(rs.getString("image"));
                flashcards.add(flashcard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flashcards;
    }

    public Vector<FlashCard> getFlashCardsSortedByNewestEdited() {
        Vector<FlashCard> flashcards = new Vector<>();
        String sql = "SELECT * FROM flashcard ORDER BY update_at DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FlashCard flashcard = new FlashCard();
                flashcard.setFlashcard_id(rs.getInt("flashcard_id"));
                flashcard.setQuestion(rs.getString("question"));
                flashcard.setAnswer(rs.getString("answer"));
                flashcard.setCreate_at(rs.getString("create_at"));
                flashcard.setUpdate_at(rs.getString("update_at"));
                flashcard.setActive(rs.getInt("active"));
                flashcard.setCategory_id(rs.getInt("Category_id"));
                flashcard.setImage(rs.getString("image"));
                flashcards.add(flashcard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flashcards;
    }

    public Vector<FlashCard> getFlashCardsSortedByOldestEdited() {
        Vector<FlashCard> flashcards = new Vector<>();
        String sql = "SELECT * FROM flashcard ORDER BY update_at ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                FlashCard flashcard = new FlashCard();
                flashcard.setFlashcard_id(rs.getInt("flashcard_id"));
                flashcard.setQuestion(rs.getString("question"));
                flashcard.setAnswer(rs.getString("answer"));
                flashcard.setCreate_at(rs.getString("create_at"));
                flashcard.setUpdate_at(rs.getString("update_at"));
                flashcard.setActive(rs.getInt("active"));
                flashcard.setCategory_id(rs.getInt("Category_id"));
                flashcard.setImage(rs.getString("image"));
                flashcards.add(flashcard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flashcards;
    }

    public Vector<FlashCard> getFlashCardsByDateRange(String startDate, String endDate, String filterBy) {
        Vector<FlashCard> flashcards = new Vector<>();
        String sql = "";

        if ("createdDate".equals(filterBy)) {
            sql = "SELECT * FROM flashcard WHERE create_at BETWEEN ? AND ?";
        } else if ("lastEditedDate".equals(filterBy)) {
            sql = "SELECT * FROM flashcard WHERE update_at BETWEEN ? AND ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, startDate);
            stmt.setString(2, endDate);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                FlashCard flashcard = new FlashCard();
                flashcard.setFlashcard_id(rs.getInt("flashcard_id"));
                flashcard.setQuestion(rs.getString("question"));
                flashcard.setAnswer(rs.getString("answer"));
                flashcard.setCreate_at(rs.getString("create_at"));
                flashcard.setUpdate_at(rs.getString("update_at"));
                flashcard.setActive(rs.getInt("active"));
                flashcard.setCategory_id(rs.getInt("Category_id"));
                flashcard.setImage(rs.getString("image"));
                flashcards.add(flashcard);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flashcards;
    }

    public int updateFlashcard(FlashCard flashcard) {
        String sql = "UPDATE [flashcard] SET question=?, answer=?, update_at=?, active=?, Category_id=?, image=? WHERE flashcard_id=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, flashcard.getQuestion());
            ps.setString(2, flashcard.getAnswer());
            ps.setString(3, flashcard.getUpdate_at());
            ps.setInt(4, flashcard.getActive());
            ps.setInt(5, flashcard.getCategory_id());
            ps.setString(6, flashcard.getImage());
            ps.setInt(7, flashcard.getFlashcard_id());
            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public FlashCard getFlashCardByID2(int flashcard_id) {
        String sql = "select * from [flashcard] where flashcard_id = ?";
        FlashCard flashcard = new FlashCard();
        try {
            PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setInt(1, flashcard_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                flashcard = new FlashCard(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
            return null;
        }
        return flashcard;
    }

    public boolean flashcardNameExists(String question, int flashcardId) {
        String sql = "SELECT COUNT(*) FROM flashcard WHERE question = ? AND flashcard_id != ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, question);
            ps.setInt(2, flashcardId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        for (FlashCard i : new DAOFlashCard().getFlashCardByRandomNumber(100, 2, "(0)")) {
            System.out.println(i);
        }
    }

}
