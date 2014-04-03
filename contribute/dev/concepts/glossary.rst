
.. _glossary:

========
Glossary
========

Glossaire français
==================

API
---

Ensemble des classes, fonctions, attributs et méthodes fournies par une bibliothèque et accessible de l'extérieur.

Concept
-------

Contrat
-------

Information permettant à un objet informatique de décrire ce qu'il s'engage à faire.

.. note::

   Par exemple, un éditeur de texte propose le contrat suivant :
       - afficher du texte
       - éditer du texte
       - charger un fichier
       - sauver un fichier 

Ce contrat permet aux objets informatiques de communiquer entre eux et déléguer le travail.
Concrêtement, cette information est définie à l'aide d'Interface constituant une API 

Contrat explicite
~~~~~~~~~~~~~~~~~

La manière dont l'objet se comporte est décrit explicitement.
La forme n'est pas imposé. Il peut s'agir d'instructions informatiques ou de
documentations.

Contrat implicite
~~~~~~~~~~~~~~~~~

Ce dit dans le cas où l'on peut déduire comment se comporte un objet mais 
aucune instruction ou documentation ne le certifie.
Utiliser ce type de contrat est dangereux.

Coupling
~~~~~~~~

High/Strong/Tight coupling
Low/Weak/Loose coupling


Extension OpenAleaLab
---------------------

Spécialisation du lab OpenAleaLab pour une thématique scientifique précise.
Dans d'autres logiciels, on appelle parfois cela une "couche metier" car elle est utilisé dans metier donné.

.. note::

   Exemple: TissueLab est l'extension permettant de travailler sur les tissus biologiques

Interface
---------

Instructions informatiques décrivant un contrat.

Par exemple, une classe virtuelle pure mais de nombreuses approches sont possibles. 
L'interface peut être plus ou moins contraingnante. 
Par exemple en imposant le nom des méthodes, le nom et les paramètres, le nom, les paramètres et les types, et ainsi de suite.

.. note ::

   Exemple de définition d'interface en Python décrivant un contrat d'éditeur de texte

   .. code-block:: python
   
      class ITextEditor:
          def __init__(self):
              pass
              
          def display(text):
              pass
              
          def load(filename):
              pass
              
          def save(filename):
              pass


