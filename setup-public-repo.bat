@echo off
echo.
echo CONFIGURATION REPOSITORY PUBLIC AKWABA ENGLISH
echo ===============================================
echo.

:: Etape 1: Copie du README final
echo ETAPE 1: Installation du README public...
if exist "README-PUBLIC-FINAL.md" (
    copy "README-PUBLIC-FINAL.md" "README.md" >nul
    echo OK: README public installe
) else (
    echo ATTENTION: README-PUBLIC-FINAL.md non trouve, utilisation du README actuel
)
echo.

:: Etape 2: Verification des images
echo ETAPE 2: Verification des images...
if not exist "screenshots" (
    echo ERREUR: Dossier screenshots manquant
    pause
    exit /b 1
)

:: Copier les images avec les bons noms si necessaire
if exist "screenshots\ACCUEIL.png" if not exist "screenshots\accueil.png" (
    copy "screenshots\ACCUEIL.png" "screenshots\accueil.png" >nul
)
if exist "screenshots\INTERFACE_CARTES_LECONS.png" if not exist "screenshots\interface-lecons.png" (
    copy "screenshots\INTERFACE_CARTES_LECONS.png" "screenshots\interface-lecons.png" >nul
)
if exist "screenshots\INTERFACE_QUESTIONS.png" if not exist "screenshots\interface-questions.png" (
    copy "screenshots\INTERFACE_QUESTIONS.png" "screenshots\interface-questions.png" >nul
)
if exist "screenshots\INTERFACE_QUESTIONS_2.png" if not exist "screenshots\interface-questions-2.png" (
    copy "screenshots\INTERFACE_QUESTIONS_2.png" "screenshots\interface-questions-2.png" >nul
)

set "IMAGES_OK=1"
if not exist "screenshots\accueil.png" (
    echo ATTENTION: accueil.png manquant
    set "IMAGES_OK=0"
)
if not exist "screenshots\interface-lecons.png" (
    echo ATTENTION: interface-lecons.png manquant
    set "IMAGES_OK=0"
)
if not exist "screenshots\interface-questions.png" (
    echo ATTENTION: interface-questions.png manquant
    set "IMAGES_OK=0"
)
if not exist "screenshots\interface-questions-2.png" (
    echo ATTENTION: interface-questions-2.png manquant
    set "IMAGES_OK=0"
)

if "%IMAGES_OK%"=="1" (
    echo OK: Toutes les images sont presentes
) else (
    echo ATTENTION: Certaines images manquent
    echo Voulez-vous continuer quand meme ? (o/n)
    set /p "CONTINUE="
    if /i not "%CONTINUE%"=="o" (
        echo Operation annulee
        pause
        exit /b 1
    )
)
echo.

:: Etape 3: Creation du fichier LICENSE
echo ETAPE 3: Creation de la licence MIT...
if not exist "LICENSE" (
    echo MIT License > LICENSE
    echo. >> LICENSE
    echo Copyright (c) 2025 Akwaba English >> LICENSE
    echo. >> LICENSE
    echo Permission is hereby granted, free of charge, to any person obtaining a copy >> LICENSE
    echo of this software and associated documentation files (the "Software"), to deal >> LICENSE
    echo in the Software without restriction, including without limitation the rights >> LICENSE
    echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell >> LICENSE
    echo copies of the Software, and to permit persons to whom the Software is >> LICENSE
    echo furnished to do so, subject to the following conditions: >> LICENSE
    echo. >> LICENSE
    echo The above copyright notice and this permission notice shall be included in all >> LICENSE
    echo copies or substantial portions of the Software. >> LICENSE
    echo. >> LICENSE
    echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR >> LICENSE
    echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, >> LICENSE
    echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE >> LICENSE
    echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER >> LICENSE
    echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, >> LICENSE
    echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE >> LICENSE
    echo SOFTWARE. >> LICENSE
    echo OK: Licence MIT creee
) else (
    echo OK: Licence deja presente
)
echo.

:: Etape 4: Creation du CONTRIBUTING.md
echo ETAPE 4: Creation du guide de contribution...
if not exist "CONTRIBUTING.md" (
    echo # Contributing to Akwaba English > CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo Thank you for your interest in contributing to Akwaba English! >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo ## How to Contribute >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo 1. Fork the repository >> CONTRIBUTING.md
    echo 2. Create a feature branch >> CONTRIBUTING.md
    echo 3. Make your changes >> CONTRIBUTING.md
    echo 4. Test your changes >> CONTRIBUTING.md
    echo 5. Submit a pull request >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo ## Development Setup >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo ```bash >> CONTRIBUTING.md
    echo npm install >> CONTRIBUTING.md
    echo npm run dev:web >> CONTRIBUTING.md
    echo ``` >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo ## Code Style >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo - Follow existing code patterns >> CONTRIBUTING.md
    echo - Run `npm run lint` before committing >> CONTRIBUTING.md
    echo - Add tests for new features >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo ## Questions? >> CONTRIBUTING.md
    echo. >> CONTRIBUTING.md
    echo Open an issue or start a discussion! >> CONTRIBUTING.md
    echo OK: Guide de contribution cree
) else (
    echo OK: Guide de contribution deja present
)
echo.

:: Etape 5: Verification du build
echo ETAPE 5: Test du build final...
npm run build:web >nul 2>&1
if errorlevel 1 (
    echo ERREUR: Build echoue
    echo Verifiez les erreurs avec: npm run build:web
    pause
    exit /b 1
) else (
    echo OK: Build reussi
)
echo.

:: Etape 6: Commit final
echo ETAPE 6: Commit pour repository public...
git add .
git commit -m "Repository public Akwaba English v2.0.0

- README public complet avec nouvelles images
- Documentation finale d'experience
- Licence MIT ajoutee
- Guide de contribution cree
- Configuration optimisee pour open source"

if errorlevel 1 (
    echo ATTENTION: Aucun changement a commiter ou erreur Git
) else (
    echo OK: Commit cree
)
echo.

:: Etape 7: Instructions finales
echo ETAPE 7: Instructions finales...
echo.
echo REPOSITORY PUBLIC PRET !
echo ========================
echo.
echo Prochaines etapes manuelles:
echo.
echo 1. GITHUB:
echo    - Creer un nouveau repository public "akwaba-english"
echo    - Ou renommer le repository existant
echo    - Pousser le code: git push origin main
echo.
echo 2. VERCEL:
echo    - Connecter le nouveau repository
echo    - Deployer: vercel --prod
echo    - URL finale: https://akwaba-english.vercel.app
echo.
echo 3. DOCUMENTATION:
echo    - Mettre a jour les liens GitHub dans README.md
echo    - Ajouter les badges de statut
echo    - Configurer GitHub Pages si souhaite
echo.
echo 4. PROMOTION:
echo    - Partager sur les reseaux sociaux
echo    - Soumettre a des directories d'apps educatives
echo    - Contacter des blogs tech africains
echo.
echo Fichiers crees/mis a jour:
echo - README.md (version publique)
echo - LICENSE (MIT)
echo - CONTRIBUTING.md
echo - DOCUMENTATION_FINALE_EXPERIENCE.md
echo.
echo Akwaba dans l'open source !
echo.
pause
