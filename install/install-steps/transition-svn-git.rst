
.. warning::
  
    If you want to use code from both gforge/svn and git, for example PlantGL and OpenAleaLab 
    or Statistic tools and TissueLab, you need to desactivate modules in vplants that are available also in git: 

    please follow these steps:

    - open vplants/multisetup.py and remove (or comment with "#") these lines

      - "container" (now in github/openalea/openalea-components)
      - "svgdraw" (now in github/openalea/openalea-components)
      - "tissue" (now in gforge/tissue project)
      - "vtissue" (now in gforge/mars_alt)

    - reinstall deploy, sconsx, openalea and openalea-components from github
    - reinstall additional packages like plantlab or mars_alt


