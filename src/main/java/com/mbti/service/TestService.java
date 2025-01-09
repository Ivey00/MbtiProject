package com.mbti.service;

import java.util.HashMap;
import java.util.Map;

import com.mbti.model.MBTIUser;

import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

@Stateless
public class TestService {

    @PersistenceContext(unitName = "MBTIPersistenceUnit")
    private EntityManager entityManager;

    public String calculateMBTIType(int countE, int countI, int countS, int countN, int countT, int countF, int countJ, int countP) {
        StringBuilder mbtiType = new StringBuilder();

        mbtiType.append(countE > countI ? "E" : "I");
        mbtiType.append(countS > countN ? "S" : "N");
        mbtiType.append(countT > countF ? "T" : "F");
        mbtiType.append(countJ > countP ? "J" : "P");

        return mbtiType.toString();
    }

    public MBTIUser saveUserResult(String name, String email, String mbtiType) {
        if (name == null || email == null || mbtiType == null) {
            throw new IllegalArgumentException("Name, email, and MBTI type cannot be null");
        }

        if (isEmailExists(email)) {
            throw new IllegalArgumentException("Cet email est déjà utilisé.");
        }

        MBTIUser user = new MBTIUser(name, email, mbtiType);
        entityManager.persist(user);
        entityManager.flush();

        return user;
    }

    public String getMBTIDescription(String mbtiType) {
        Map<String, String> descriptions = new HashMap<>();
        descriptions.put("INFJ", "Calme, intuitif et très empathique. Souvent trouvé chez des leaders inspirants.");
        descriptions.put("INTJ", "Analytique, stratégique et orienté vers les objectifs.");
        descriptions.put("INFP", "Créatif, idéaliste et guidé par des valeurs profondes.");
        descriptions.put("INTP", "Logique, curieux et toujours à la recherche de nouvelles idées.");
        descriptions.put("ISFJ", "Fiable, attentionné et motivé par le désir d'aider les autres.");
        descriptions.put("ISTJ", "Pragmatique, responsable et attaché à la tradition.");
        descriptions.put("ISFP", "Artiste dans l'âme, calme, spontané et sensible.");
        descriptions.put("ISTP", "Pratique, observateur et orienté vers la résolution de problèmes.");
        descriptions.put("ENFJ", "Charismatique, leader naturel, et souvent préoccupé par le bien-être des autres.");
        descriptions.put("ENTJ", "Leader stratégique, organisé et motivé par les résultats.");
        descriptions.put("ENFP", "Énergique, créatif et toujours à la recherche de nouvelles opportunités.");
        descriptions.put("ENTP", "Innovateur, débrouillard et stimulé par les défis intellectuels.");
        descriptions.put("ESFJ", "Chaleureux, sociable et toujours prêt à aider les autres.");
        descriptions.put("ESTJ", "Organisé, logique et souvent perçu comme un gestionnaire naturel.");
        descriptions.put("ESFP", "Enthousiaste, spontané et aime profiter du moment présent.");
        descriptions.put("ESTP", "Aventurier, pragmatique et aime relever des défis immédiats.");

        return descriptions.getOrDefault(mbtiType, "Type de personnalité unique !");
    }

    private boolean isEmailExists(String email) {
        try {
            long count = entityManager.createQuery("SELECT COUNT(u) FROM MBTIUser u WHERE u.email = :email", Long.class)
                                      .setParameter("email", email)
                                      .getSingleResult();
            return count > 0;
        } catch (Exception e) {
            return false;
        }
    }
}
