{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  commonmark,
  docutils,
  sphinx,
  isPy3k,
}:

buildPythonPackage (finalAttrs: {
  pname = "recommonmark";
  version = "0.7.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rtfd";
    repo = "recommonmark";
    tag = finalAttrs.version;
    sha256 = "0kwm4smxbgq0c0ybkxfvlgrfb3gq9amdw94141jyykk9mmz38379";
  };

  build-system = [ setuptools ];

  dependencies = [
    commonmark
    docutils
    sphinx
  ];

  doCheck = !isPy3k; # Not yet compatible with latest Sphinx.
  pythonImportsCheck = [ "recommonmark" ];

  meta = {
    description = "Docutils-compatibility bridge to CommonMark";
    homepage = "https://github.com/rtfd/recommonmark";
    license = lib.licenses.mit;
  };
})
