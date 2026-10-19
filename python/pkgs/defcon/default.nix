{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
  fonttools,
  fontpens,
}:

buildPythonPackage (finalAttrs: {
  pname = "defcon";
  version = "0.12.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Jd/n/QFSzPKSyxkNGSikfViImcILBGhUKT4DnhyT5eA=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [
    fonttools
  ]
  ++ fonttools.optional-dependencies.ufo
  ++ fonttools.optional-dependencies.unicode;

  pythonImportsCheck = [ "defcon" ];

  optional-dependencies = {
    pens = [ fontpens ];
    lxml = [ fonttools ] ++ fonttools.optional-dependencies.lxml;
  };

  meta = {
    description = "Set of UFO based objects for use in font editing applications";
    homepage = "https://github.com/robotools/defcon";
    license = lib.licenses.mit;
  };
})
