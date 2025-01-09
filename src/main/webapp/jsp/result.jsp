<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Résultats du Test MBTI</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }
        .results-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
        }
        .mbti-type {
            color: #007bff;
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .description {
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .user-info {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="results-container">
        <h1>Votre Personnalité MBTI</h1>
        
        <div class="mbti-type">
            <%= request.getAttribute("mbtiType") %>
        </div>
        
        <div class="description">
            <%= request.getAttribute("mbtiDescription") %>
        </div>
        
        <div class="user-info">
            <h3>Informations Personnelles</h3>
            <p>Nom : <%= request.getParameter("name") %></p>
            <p>Email : <%= request.getParameter("email") %></p>
        </div>
        
        <a href="/jsp/login.jsp" class="btn">Retour</a>
    </div>
</body>
</html>