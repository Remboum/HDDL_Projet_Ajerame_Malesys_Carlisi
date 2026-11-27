# Can synthetic images improve a classifier?

### Résumé du plan

* **Dataset de référence :** Déterminer le nombre minimal $N$ d'images réelles nécessaire pour atteindre une accuracy cible de référence (80% en binaire, 50% en $p$ classes) évaluée uniquement sur des données réelles.
* **Impact des données synthétiques :** Mesurer l'évolution des performances (gain, plateau, dégradation) en ajoutant progressivement des images synthétiques au dataset de référence selon des multiples de $N$ ($0N, 0.5N, N, 2N, \dots, 10N$), d'abord en binaire puis en $p$ classes.
* **Interprétabilité (Xplique) :** Analyser uniquement le classifieur binaire avec Xplique pour observer comment l'ajout de données synthétiques modifie les zones d'attention et les décisions du modèle sur les vraies images.
