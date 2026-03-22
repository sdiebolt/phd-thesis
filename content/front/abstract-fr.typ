#import "/glossary.typ": *

#set text(lang: "fr")
#heading([Résumé], numbering: none)

L'imagerie fonctionelle par ultrasons (@fusi:short) est une technique de neuroimagerie
prometteuse pour l'étude du fonctionnement cérébral dans les modèles précliniques. Elle
offre des avantages en termes de coût, de résolution spatio-temporelle, et de capacité à
imager des animaux éveillés et en mouvement. Toutefois, son adoption pour l'imagerie
éveillée reste freinée par des verrous méthodologiques importants, en particulier la
sensibilité aux artefacts de mouvement qui varient selon les conditions expérimentales.
Cette thèse propose des solutions innovantes pour lever cette limitation et démontre le
potentiel du @fusi:short dans la recherche neuropharmacologique. Par l'évaluation
systématique de près de 800 configurations de prétraitement sur plusieurs jeux de
données, nous avons caractérisé les propriétés spatiales et temporelles des artéfacts de
mouvement en @fusi:short éveillé et développé des stratégies de corrections optimisées.
Nos résultats démontrent que le filtrage adaptatif de _clutter_ est plus efficace que
les méthodes statiques traditionnelles, que le filtrage passe-haut surpasse les
approches passe-bande conventionelles, et que la prise en compte de composantes
anatomiques (CompCor) améliore nettement la régression de nuisances dans les analyses de
la connectivité fonctionnelle. Ces avancées renforcent la fiabilité des comparaisons
inter-groupes, souvent compromises par les artéfacts de mouvement. Nous avons ensuite
validé l'intérêt du @fusi:short pour les études pharmacologiques à travers l'étude de
trois classes majeures de composés---opioïdes, cannabinoïdes, et psychédéliques
sérotoninergiques---chez des souris éveillées. Chaque classe induit des altérations
spécifiques de la connectivité fonctionnelle, assimilables à de véritables "empreintes
pharmacologiques". L'étude des opioïdes révèle une dysconnectivité
cortico-sous-corticale associée à l'efficacité analgésique, sans forte corrélation avec
les effets secondaires. Les cannabinoïdes induisent une dynamique biphasique, marquée
par des effets rapides cortico-thalamiques suivis d'une altération plus lente de
l'hippocampe. Enfin, la psilocybine provoque des modifications dose-dépendantes des
réseaux hippocampo-thalamiques, sensibles en partie au blocage des récepteurs
@fiveht:short#sub[2A]. Ces résultats valident la pertinence pharmacologique du
@fusi:short à travers l’analyse de la dose-réponse, des dynamiques temporelles, de la
spécificité des récepteurs, et du développement de la tolérance. Pour conduire ces
études, nous avons développé des outils de structuration de données et d'analyse
standardisés, dont @fusi:short\-@bids:short, une extension du standard de neuroimagerie
@bids:short adaptée aux spécificités du @fusi:short, ainsi que PyfUS, une librairie
Python d'analyse @fusi:short. Conçu à l’interface entre recherche académique et
développement industriel, PyfUS a servi de plateforme pour tester et valider les
innovations méthodologiques avant leur intégration dans des logiciels commerciaux
d'Iconeus, garantissant fiabilité et flexibilité. Ces contributions démontrent le
potentiel du @fusi:short comme outil de neuroimagerie accessible et puissant, capable de
différencier des composés aux mécanismes d'action distincts, suggérant des applications
dans le criblage pharmacologique et le développement de médicaments.
