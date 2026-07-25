{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hupper,
  pastedeploy,
  plaster,
  plaster-pastedeploy,
  repoze-lru,
  setuptools_80,
  translationstring,
  venusian,
  webob,
  zope-deprecation,
  zope-interface,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyramid";
  version = "2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Pylons";
    repo = "pyramid";
    tag = finalAttrs.version;
    hash = "sha256-N0zH0BpS9ImSTWeADBOBSgLYI062sdLxTzwBENAawFc=";
  };

  build-system = [ setuptools_80 ];

  dependencies = [
    hupper
    pastedeploy
    plaster
    plaster-pastedeploy
    repoze-lru
    translationstring
    venusian
    webob
    zope-deprecation
    zope-interface
  ];
  pythonImportsCheck = [ "pyramid" ];

  meta = {
    description = "Python web framework";
    homepage = "https://trypyramid.com/";
    license = lib.licenses.bsd0;
    maintainers = [ ];
  };
})
