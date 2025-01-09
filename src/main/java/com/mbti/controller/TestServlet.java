package com.mbti.controller;

import java.io.IOException;

import com.mbti.service.TestService;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mbti-test")
public class TestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private TestService testService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("=== Servlet Started: TestServlet ===");

        // Récupération des paramètres utilisateur
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Log des paramètres reçus
        System.out.println("Received parameters: name=" + name + ", email=" + email);

        if (name == null || email == null || name.trim().isEmpty() || email.trim().isEmpty()) {
            System.err.println("Error: Missing user information");
            request.setAttribute("error", "Information utilisateur manquante");
            return;
        }

        try {
            // Initialisation des compteurs
            int countE = 0, countI = 0, countS = 0, countN = 0, countT = 0, countF = 0, countJ = 0, countP = 0;

            System.out.println("Processing user responses...");

            // Vérification des réponses utilisateur
            for (int i = 1; i <= 20; i++) {
                String answer = request.getParameter("q" + i); // Renommage de la variable pour éviter le conflit
                if (answer == null) {
                    throw new IllegalArgumentException("Réponse manquante pour la question " + i);
                }
                switch (answer) { // Utilisation de l'ancienne syntaxe des "case"
                    case "E":
                        countE++;
                        break;
                    case "I":
                        countI++;
                        break;
                    case "S":
                        countS++;
                        break;
                    case "N":
                        countN++;
                        break;
                    case "T":
                        countT++;
                        break;
                    case "F":
                        countF++;
                        break;
                    case "J":
                        countJ++;
                        break;
                    case "P":
                        countP++;
                        break;
                    default:
                        throw new IllegalArgumentException("Réponse invalide pour la question " + i);
                }
            }

            // Log des résultats intermédiaires
            System.out.println("Counts: E=" + countE + ", I=" + countI + ", S=" + countS + ", N=" + countN + 
                               ", T=" + countT + ", F=" + countF + ", J=" + countJ + ", P=" + countP);

            // Calcul du type MBTI
            String mbtiType = testService.calculateMBTIType(countE, countI, countS, countN, countT, countF, countJ, countP);
            System.out.println("MBTI Type calculated: " + mbtiType);
            
            // Récupérer la description du type MBTI
            String mbtiDescription = testService.getMBTIDescription(mbtiType);
            System.out.println("MBTI Description: " + mbtiDescription);
            
            // Ajout des attributs pour la page de résultats
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("mbtiType", mbtiType);
            request.setAttribute("mbtiDescription", mbtiDescription);
            
            // Forward vers la page de résultats
            System.out.println("Forwarding to result.jsp...");
            request.getRequestDispatcher("/jsp/result.jsp").forward(request, response);
            
            
            // Sauvegarder le résultat utilisateur
            testService.saveUserResult(name, email, mbtiType);
            System.out.println("User result saved: name=" + name + ", email=" + email + ", mbtiType=" + mbtiType);



        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Erreur : " + e.getMessage());
        }

        System.out.println("=== Servlet Completed: TestServlet ===");
    }
}

