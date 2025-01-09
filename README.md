# MbtiProject

![image](https://github.com/user-attachments/assets/00eea8a5-1600-4626-a92f-f66819b87ac6)

## Description

Ce projet est une application web développée en Java EE qui permet aux utilisateurs de découvrir leur type de personnalité selon le modèle MBTI (Myers-Briggs Type Indicator). L'application propose un questionnaire interactif et fournit des descriptions détaillées des 16 types de personnalité.

## Contenu du dépôt

- `src/main/java/` : Contient le code source Java de l'application.
- `src/main/resources/` : Contient les fichiers de configuration et les ressources.
- `src/main/webapp/` : Contient les fichiers JSP, les ressources statiques (CSS, JavaScript) et les pages web.
- `pom.xml` : Fichier de configuration Maven pour la gestion des dépendances.

## Prérequis

- Java Development Kit (JDK) 8 ou supérieur
- Apache Maven 3.6.x ou supérieur
- Serveur d'applications compatible Java EE, tel qu'Apache Tomcat 9

## Installation

1. Clonez le dépôt :

   ```bash
   git clone https://github.com/Ivey00/MbtiProject.git
   ```

2. Accédez au répertoire du projet :

   ```bash
   cd MbtiProject
   ```

3. Compilez le projet et générez le fichier WAR :

   ```bash
   mvn clean package
   ```

4. Déployez le fichier WAR généré (`target/MbtiProject.war`) sur votre serveur d'applications.

5. Accédez à l'application via votre navigateur à l'adresse appropriée, par exemple : `http://localhost:8080/MbtiProject`.

## Utilisation

- Remplissez le questionnaire en ligne pour déterminer votre type de personnalité MBTI.
- Consultez les descriptions détaillées de chaque type de personnalité pour mieux comprendre vos traits caractéristiques.

## Auteurs

- [Ivey00](https://github.com/Ivey00)

## Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

---
