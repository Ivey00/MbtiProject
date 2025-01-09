<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Login - Test MBTI</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Test de Personnalité MBTI</h2>
        <form action="${pageContext.request.contextPath}/jsp/index.jsp" method="get">
            <div class="form-group">
                <label for="name">Nom Complet</label>
                <input type="text" id="name" name="name" required 
                       placeholder="Entrez votre nom complet" 
                       pattern="[A-Za-zÀ-ÿ\s]+" 
                       title="Utilisez uniquement des lettres">
            </div>
            <div class="form-group">
                <label for="email">Adresse Email</label>
                <input type="email" id="email" name="email" required 
                       placeholder="Votre adresse email" 
                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
            </div>
            <button type="submit" class="btn">Commencer le Test</button>
        </form>
    </div>
</body>
</html>