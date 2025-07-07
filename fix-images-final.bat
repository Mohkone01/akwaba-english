@echo off
echo.
echo CORRECTION FINALE DES IMAGES AKWABA ENGLISH
echo ===========================================
echo.

echo Copie des bonnes images...

:: Copier PAGE ACCUEIL.png vers accueil.png
if exist "screenshots\PAGE ACCUEIL.png" (
    copy "screenshots\PAGE ACCUEIL.png" "screenshots\accueil.png" >nul
    echo OK: accueil.png cree depuis PAGE ACCUEIL.png
) else (
    echo ERREUR: PAGE ACCUEIL.png non trouve
)

:: Copier INTERFACE_CARTES_LECONS.png vers interface-lecons.png
if exist "screenshots\INTERFACE_CARTES_LECONS.png" (
    copy "screenshots\INTERFACE_CARTES_LECONS.png" "screenshots\interface-lecons.png" >nul
    echo OK: interface-lecons.png cree depuis INTERFACE_CARTES_LECONS.png
) else (
    echo ERREUR: INTERFACE_CARTES_LECONS.png non trouve
)

:: Copier INTERFACE QUESTIONS 1.png vers interface-questions.png
if exist "screenshots\INTERFACE QUESTIONS 1.png" (
    copy "screenshots\INTERFACE QUESTIONS 1.png" "screenshots\interface-questions.png" >nul
    echo OK: interface-questions.png cree depuis INTERFACE QUESTIONS 1.png
) else (
    echo ERREUR: INTERFACE QUESTIONS 1.png non trouve
)

:: Copier INTERFACE QUESTIONS 2.png vers interface-questions-2.png
if exist "screenshots\INTERFACE QUESTIONS 2.png" (
    copy "screenshots\INTERFACE QUESTIONS 2.png" "screenshots\interface-questions-2.png" >nul
    echo OK: interface-questions-2.png cree depuis INTERFACE QUESTIONS 2.png
) else (
    echo ERREUR: INTERFACE QUESTIONS 2.png non trouve
)

echo.
echo Verification finale...
if exist "screenshots\accueil.png" echo [OK] accueil.png
if exist "screenshots\interface-lecons.png" echo [OK] interface-lecons.png
if exist "screenshots\interface-questions.png" echo [OK] interface-questions.png
if exist "screenshots\interface-questions-2.png" echo [OK] interface-questions-2.png

echo.
echo CORRECTION TERMINEE !
echo Les 4 images sont pretes pour le README GitHub.
echo.

:: Copier le README public
if exist "README-PUBLIC-FINAL.md" (
    copy "README-PUBLIC-FINAL.md" "README.md" >nul
    echo README public installe !
)

echo.
echo Prochaines etapes:
echo 1. git add .
echo 2. git commit -m "Images finales pour repository public"
echo 3. git push origin main
echo.
pause
