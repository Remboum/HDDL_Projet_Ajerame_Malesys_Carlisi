# Can synthetic images improve a classifier?

### Résumé du plan

* **Dataset de référence :** Déterminer le nombre minimal $N$ d'images réelles nécessaire pour atteindre une accuracy cible de référence (80% en binaire, 50% en $p$ classes) évaluée uniquement sur des données réelles.
* **Impact des données synthétiques :** Mesurer l'évolution des performances (gain, plateau, dégradation) en ajoutant progressivement des images synthétiques au dataset de référence selon des multiples de $N$ ($0N, 0.5N, N, 2N, \dots, 10N$), d'abord en binaire puis en $p$ classes.
* **Interprétabilité (Xplique) :** Analyser uniquement le classifieur binaire avec Xplique pour observer comment l'ajout de données synthétiques modifie les zones d'attention et les décisions du modèle sur les vraies images.


### Pipeline d'implémentation

1. **Données (VisDA-C) :** Choix des classes (2 classes visuellement proches en binaire, puis $p$ classes), découpage du set réel en `Real_Train` / `Real_Val` / `Real_Test` (Val et Test gelés), redimensionnement et normalisation identiques pour le réel et le synthétique.
2. **Classifieur :** Mise en place d'une architecture CNN (extension vers ViT en bonus si le temps le permet).
3. **Baseline (Réf) :** Calibration de $N$ (pioché dans `Real_Train`) pour atteindre l'accuracy cible (80% en binaire, 50% en $p$ classes).
4. **Augmentation & Benchmark :** Entraînement avec ajout progressif ($0N$ à $10N$) d'images **synthétiques**, comparé à deux références : la **data augmentation classique** et l'ajout de $0N$ à $10N$ images **réelles** (borne supérieure / Oracle).
5. **Interprétabilité (Xplique) :** Analyse des cartes d'attribution (ex: Grad-CAM) sur le CNN binaire avant et après ajout de synthétique pour vérifier si le modèle se recentre sur l'objet plutôt que sur le décor.
