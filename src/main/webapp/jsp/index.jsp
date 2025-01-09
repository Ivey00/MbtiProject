<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Test de Personnalité MBTI</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            max-width: 800px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            color: #333;
            margin-bottom: 30px;
        }

        .form-step {
            text-align: left;
        }

        .question {
            background-color: skyblue;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .question p {
            margin-bottom: 15px;
            font-weight: bold;
        }

        .question label {
            display: block;
            margin-bottom: 10px;
        }

        .question input[type="radio"] {
            margin-right: 10px;
        }

        .navigation-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Test de Personnalité MBTI</h1>
        <h1>Bienvenue, <%= request.getParameter("name") %> !</h1>
        <h1>Email : <%= request.getParameter("email") %></h1>

        <form id="mbtiForm" action="${pageContext.request.contextPath}/mbti-test" method="post">
            <input type="hidden" name="name" value="${param.name}">
            <input type="hidden" name="email" value="${param.email}">
            <!-- Section 1 : I/E -->
            <div class="form-step" id="step1">
                <h2>Section 1 : Introversion / Extraversion</h2>
                <div class="question">
                    <p>1. Dans les réunions de groupe, vous préférez :</p>
                    <label>
                        <input type="radio" name="q1" value="I" required>
                        Écouter attentivement
                    </label>
                    <label>
                        <input type="radio" name="q1" value="E">
                        Prendre la parole activement
                    </label>
                </div>
                <div class="question">
                    <p>2. Après une journée sociale intense, vous vous sentez :</p>
                    <label>
                        <input type="radio" name="q2" value="I" required>
                        Épuisé et ayant besoin de solitude
                    </label>
                    <label>
                        <input type="radio" name="q2" value="E">
                        Énergisé et motivé
                    </label>
                </div>
                <div class="question">
                    <p>3. Dans votre temps libre, vous préférez :</p>
                    <label>
                        <input type="radio" name="q3" value="I" required>
                        Des activités solitaires
                    </label>
                    <label>
                        <input type="radio" name="q3" value="E">
                        Des activités de groupe
                    </label>
                </div>
                <div class="question">
                    <p>4. Combien de temps passez-vous à réfléchir avant de parler ?</p>
                    <label>
                        <input type="radio" name="q4" value="I" required>
                        Beaucoup de temps
                    </label>
                    <label>
                        <input type="radio" name="q4" value="E">
                        Peu de temps
                    </label>
                </div>
                <div class="question">
                    <p>5. Comment décrivez-vous votre réseau social ?</p>
                    <label>
                        <input type="radio" name="q5" value="I" required>
                        Petit mais profond
                    </label>
                    <label>
                        <input type="radio" name="q5" value="E">
                        Large et diversifié
                    </label>
                </div>
                <div class="navigation-buttons">
                    <button type="button" onclick="nextStep(2)">Suivant</button>
                </div>
            </div>

            <!-- Section 2 : S/N -->
            <div class="form-step" id="step2" style="display:none;">
                <h2>Section 2 : Sensation / Intuition</h2>
                <div class="question">
                    <p>6. Lors de la résolution de problèmes, vous préférez :</p>
                    <label>
                        <input type="radio" name="q6" value="S" required>
                        Des solutions pratiques et concrètes
                    </label>
                    <label>
                        <input type="radio" name="q6" value="N">
                        Des solutions innovantes et créatives
                    </label>
                </div>
                <div class="question">
                    <p>7. Comment apprenez-vous le mieux ?</p>
                    <label>
                        <input type="radio" name="q7" value="S" required>
                        Par l'expérience pratique
                    </label>
                    <label>
                        <input type="radio" name="q7" value="N">
                        Par la théorie et les concepts
                    </label>
                </div>
                <div class="question">
                    <p>8. Quand vous planifiez des vacances, vous privilégiez :</p>
                    <label>
                        <input type="radio" name="q8" value="S" required>
                        Un itinéraire détaillé
                    </label>
                    <label>
                        <input type="radio" name="q8" value="N">
                        La spontanéité et les découvertes
                    </label>
                </div>
                <div class="question">
                    <p>9. Comment voyez-vous le futur ?</p>
                    <label>
                        <input type="radio" name="q9" value="S" required>
                        Comme une continuité du présent
                    </label>
                    <label>
                        <input type="radio" name="q9" value="N">
                        Comme un monde de possibilités
                    </label>
                </div>
                <div class="question">
                    <p>10. Êtes-vous plutôt :</p>
                    <label>
                        <input type="radio" name="q10" value="S" required>
                        Réaliste et pragmatique
                    </label>
                    <label>
                        <input type="radio" name="q10" value="N">
                        Imaginatif et conceptuel
                    </label>
                </div>
                <div class="navigation-buttons">
                    <button type="button" onclick="previousStep(1)">Précédent</button>
                    <button type="button" onclick="nextStep(3)">Suivant</button>
                </div>
            </div>

            <!-- Section 3 : T/F -->
            <div class="form-step" id="step3" style="display:none;">
                <h2>Section 3 : Pensée / Sentiment</h2>
                <div class="question">
                    <p>11. Dans un conflit, vous privilégiez :</p>
                    <label>
                        <input type="radio" name="q11" value="T" required>
                        La logique et l'objectivité
                    </label>
                    <label>
                        <input type="radio" name="q11" value="F">
                        L'harmonie et l'empathie
                    </label>
                </div>
                <div class="question">
                    <p>12. Comment prenez-vous des décisions importantes ?</p>
                    <label>
                        <input type="radio" name="q12" value="T" required>
                        En analysant rationnellement
                    </label>
                    <label>
                        <input type="radio" name="q12" value="F">
                        En écoutant votre cœur
                    </label>
                </div>
                <div class="question">
                    <p>13. Que privilégiez-vous dans les discussions ?</p>
                    <label>
                        <input type="radio" name="q13" value="T" required>
                        La logique et les faits
                    </label>
                    <label>
                        <input type="radio" name="q13" value="F">
                        Les sentiments et les relations
                    </label>
                </div>
                <div class="question">
                    <p>14. Comment gérez-vous un conflit ?</p>
                    <label>
                        <input type="radio" name="q14" value="T" required>
                        En cherchant une solution objective
                    </label>
                    <label>
                        <input type="radio" name="q14" value="F">
                        En essayant de préserver l'harmonie
                    </label>
                </div>
                <div class="question">
                    <p>15. Quelle est votre priorité lorsque vous travaillez en groupe ?</p>
                    <label>
                        <input type="radio" name="q15" value="T" required>
                        Atteindre les objectifs efficacement
                    </label>
                    <label>
                        <input type="radio" name="q15" value="F">
                        Maintenir de bonnes relations entre les membres
                    </label>
                </div>
                <div class="navigation-buttons">
                    <button type="button" onclick="previousStep(2)">Précédent</button>
                    <button type="button" onclick="nextStep(4)">Suivant</button>
                </div>
            </div>

            <!-- Section 4 : P/J -->
            <div class="form-step" id="step4" style="display:none;">
                <h2>Section 4 : Perception / Jugement</h2>
                <div class="question">
                    <p>16. Comment gérez-vous vos projets ?</p>
                    <label>
                        <input type="radio" name="q16" value="J" required>
                        Avec une planification précise
                    </label>
                    <label>
                        <input type="radio" name="q16" value="P">
                        De manière flexible et adaptable
                    </label>
                </div>
                <div class="question">
                    <p>17. Préférez-vous :</p>
                    <label>
                        <input type="radio" name="q17" value="J" required>
                        La stabilité et la prévisibilité
                    </label>
                    <label>
                        <input type="radio" name="q17" value="P">
                        Le changement et la nouveauté
                    </label>
                </div>
                <div class="question">
                    <p>18. Comment abordez-vous vos tâches quotidiennes ?</p>
                    <label>
                        <input type="radio" name="q18" value="J" required>
                        Avec une liste organisée
                    </label>
                    <label>
                        <input type="radio" name="q18" value="P">
                        En improvisant au fur et à mesure
                    </label>
                </div>
                <div class="question">
                    <p>19. Comment préférez-vous organiser votre emploi du temps ?</p>
                    <label>
                        <input type="radio" name="q19" value="J" required>
                        Avec un planning fixe
                    </label>
                    <label>
                        <input type="radio" name="q19" value="P">
                        En gardant vos options ouvertes
                    </label>
                </div>
                <div class="question">
                    <p>20. Lorsqu'un plan ne fonctionne pas, vous :</p>
                    <label>
                        <input type="radio" name="q20" value="J" required>
                        Préférez ajuster méthodiquement le plan
                    </label>
                    <label>
                        <input type="radio" name="q20" value="P">
                        Trouvez une autre solution spontanément
                    </label>
                </div>
                <div class="navigation-buttons">
                    <button type="button" onclick="previousStep(3)">Précédent</button>
                    <button type="submit">Soumettre le Test</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        function nextStep(step) {
            document.getElementById('step1').style.display = 'none';
            document.getElementById('step2').style.display = 'none';
            document.getElementById('step3').style.display = 'none';
            document.getElementById('step4').style.display = 'none';
            document.getElementById('step' + step).style.display = 'block';
        }

        function previousStep(step) {
            document.getElementById('step1').style.display = 'none';
            document.getElementById('step2').style.display = 'none';
            document.getElementById('step3').style.display = 'none';
            document.getElementById('step4').style.display = 'none';
            document.getElementById('step' + step).style.display = 'block';
        }
    </script>
</body>
</html>