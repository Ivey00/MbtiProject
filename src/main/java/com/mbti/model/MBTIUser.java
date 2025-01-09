package com.mbti.model;

import java.io.Serializable; // Interface pour la sérialisation

// Import des annotations JPA
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity // Indique que cette classe est une entité JPA
@Table(name = "mbti_users") // Correspond à la table 'mbti_users' dans la base de données
public class MBTIUser implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id // Identifiant unique de l'utilisateur
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-incrémentation dans la base
    private Long id;

    @NotBlank(message = "Le nom ne peut pas être vide") // Validation pour s'assurer que le champ n'est pas vide
    @Size(max = 100, message = "Le nom ne peut pas dépasser 100 caractères") // Validation de la taille maximale
    @Column(nullable = false) // Champ obligatoire dans la table
    private String name;

    @Email(message = "L'adresse email doit être valide") // Validation pour s'assurer que l'email a un format valide
    @NotBlank(message = "L'email ne peut pas être vide") // Validation pour s'assurer que l'email n'est pas vide
    @Column(nullable = false, unique = true) // Champ obligatoire et unique
    private String email;

    @NotBlank(message = "Le type MBTI ne peut pas être vide") // Validation pour s'assurer que le type MBTI n'est pas vide
    @Size(min = 4, max = 4, message = "Le type MBTI doit avoir une longueur de 4 caractères") // Validation pour s'assurer que le type MBTI est toujours de longueur 4
    @Column(nullable = false, length = 4) // Champ obligatoire avec une longueur limitée
    private String mbtiType;

    // Constructeur par défaut requis par JPA
    public MBTIUser() {}

    // Constructeur avec paramètres
    public MBTIUser(String name, String email, String mbtiType) {
        this.name = name;
        this.email = email;
        this.mbtiType = mbtiType;
    }

    // Getters et setters pour chaque champ
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMbtiType() { return mbtiType; }
    public void setMbtiType(String mbtiType) { this.mbtiType = mbtiType; }
}

